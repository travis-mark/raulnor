defmodule RaulnorWeb.StatBlockController do
  use RaulnorWeb, :controller

  alias Raulnor.Characters
  alias Raulnor.Characters.StatBlock

  def index(conn, _params) do
    stat_blocks = Characters.list_stat_blocks()

    render(conn, :index,
      stat_blocks: stat_blocks,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/stat_block_controller.ex"
        )
    )
  end

  def new(conn, _params) do
    sizes = Characters.StatBlock.sizes()
    changeset = Characters.change_stat_block(%StatBlock{})

    render(conn, :new,
      changeset: changeset,
      sizes: sizes,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/stat_block_controller.ex"
        )
    )
  end

  def create(conn, %{"stat_block" => stat_block_params}) do
    case Characters.create_stat_block(stat_block_params) do
      {:ok, stat_block} ->
        conn
        |> put_flash(:info, "Stat block created successfully.")
        |> redirect(to: ~p"/stat_blocks/#{stat_block}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new,
          changeset: changeset,
          source:
            RaulnorWeb.CoreComponents.source_href(
              "lib/raulnor_web/controllers/stat_block_controller.ex"
            )
        )
    end
  end

  def show(conn, %{"id" => id}) do
    stat_block = Characters.get_stat_block!(id)

    render(conn, :show,
      stat_block: stat_block,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/stat_block_controller.ex"
        )
    )
  end

  def edit(conn, %{"id" => id}) do
    sizes = Characters.StatBlock.sizes()
    stat_block = Characters.get_stat_block!(id)
    changeset = Characters.change_stat_block(stat_block)

    render(conn, :edit,
      sizes: sizes,
      stat_block: stat_block,
      changeset: changeset,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/stat_block_controller.ex"
        )
    )
  end

  def update(conn, %{"id" => id, "stat_block" => stat_block_params}) do
    stat_block = Characters.get_stat_block!(id)

    case Characters.update_stat_block(stat_block, stat_block_params) do
      {:ok, stat_block} ->
        conn
        |> put_flash(:info, "Stat block updated successfully.")
        |> redirect(to: ~p"/stat_blocks/#{stat_block}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit,
          stat_block: stat_block,
          changeset: changeset,
          source:
            RaulnorWeb.CoreComponents.source_href(
              "lib/raulnor_web/controllers/stat_block_controller.ex"
            )
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    stat_block = Characters.get_stat_block!(id)
    {:ok, _stat_block} = Characters.delete_stat_block(stat_block)

    conn
    |> put_flash(:info, "Stat block deleted successfully.")
    |> redirect(to: ~p"/stat_blocks")
  end
end
