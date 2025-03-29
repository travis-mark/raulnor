defmodule RaulnorWeb.HelloController do
  use RaulnorWeb, :controller

  def index(conn, _params) do
    render(conn, :index,
      source:
        RaulnorWeb.CoreComponents.source_href("lib/raulnor_web/controllers/hello_controller.ex")
    )
  end

  def show(conn, %{"name" => name}) do
    render(conn, :show,
      name: name,
      source:
        RaulnorWeb.CoreComponents.source_href("lib/raulnor_web/controllers/hello_controller.ex")
    )
  end
end
