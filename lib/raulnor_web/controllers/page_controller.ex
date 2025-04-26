defmodule RaulnorWeb.PageController do
  use RaulnorWeb, :controller

  alias Raulnor.Wiki
  alias Raulnor.Wiki.Page

  def index(conn, _params) do
    pages = Wiki.list_pages()
    render(conn, :index, pages: pages)
  end

  def new(conn, _params) do
    changeset = Wiki.change_page(%Page{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"page" => page_params}) do
    case Wiki.create_page(page_params) do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Page created successfully.")
        |> redirect(to: ~p"/wiki/pages/#{page}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    page = Wiki.get_page!(id)
    render(conn, :show, page: page)
  end

  def edit(conn, %{"id" => id}) do
    page = Wiki.get_page!(id)
    changeset = Wiki.change_page(page)
    render(conn, :edit, page: page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "page" => page_params}) do
    page = Wiki.get_page!(id)

    case Wiki.update_page(page, page_params) do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Page updated successfully.")
        |> redirect(to: ~p"/wiki/pages/#{page}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, page: page, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    page = Wiki.get_page!(id)
    {:ok, _page} = Wiki.delete_page(page)

    conn
    |> put_flash(:info, "Page deleted successfully.")
    |> redirect(to: ~p"/wiki/pages")
  end
end
