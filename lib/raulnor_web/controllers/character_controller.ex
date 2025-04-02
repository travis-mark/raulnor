defmodule RaulnorWeb.CharacterController do
  use RaulnorWeb, :controller

  alias Raulnor.FiveE
  alias Raulnor.FiveE.Character

  def index(conn, _params) do
    characters = FiveE.list_characters()

    render(conn, :index,
      characters: characters,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/character_controller.ex"
        )
    )
  end

  def new(conn, _params) do
    changeset = FiveE.change_character(%Character{})

    render(conn, :new,
      changeset: changeset,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/character_controller.ex"
        )
    )
  end

  def create(conn, %{"character" => character_params}) do
    case FiveE.create_character(character_params) do
      {:ok, character} ->
        conn
        |> put_flash(:info, "Character created successfully.")
        |> redirect(to: ~p"/characters/#{character}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new,
          changeset: changeset,
          source:
            RaulnorWeb.CoreComponents.source_href(
              "lib/raulnor_web/controllers/character_controller.ex"
            )
        )
    end
  end

  def show(conn, %{"id" => id}) do
    character = FiveE.get_character!(id)

    render(conn, :show,
      character: character,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/character_controller.ex"
        )
    )
  end

  def edit(conn, %{"id" => id}) do
    character = FiveE.get_character!(id)
    changeset = FiveE.change_character(character)

    render(conn, :edit,
      character: character,
      changeset: changeset,
      source:
        RaulnorWeb.CoreComponents.source_href(
          "lib/raulnor_web/controllers/character_controller.ex"
        )
    )
  end

  def update(conn, %{"id" => id, "character" => character_params}) do
    character = FiveE.get_character!(id)

    case FiveE.update_character(character, character_params) do
      {:ok, character} ->
        conn
        |> put_flash(:info, "Character updated successfully.")
        |> redirect(to: ~p"/characters/#{character}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit,
          character: character,
          changeset: changeset,
          source:
            RaulnorWeb.CoreComponents.source_href(
              "lib/raulnor_web/controllers/character_controller.ex"
            )
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    character = FiveE.get_character!(id)
    {:ok, _character} = FiveE.delete_character(character)

    conn
    |> put_flash(:info, "Character deleted successfully.")
    |> redirect(to: ~p"/characters")
  end
end
