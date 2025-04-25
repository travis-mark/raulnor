defmodule RaulnorWeb.HelloController do
  use RaulnorWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"name" => name}) do
    render(conn, :show, name: name)
  end
end
