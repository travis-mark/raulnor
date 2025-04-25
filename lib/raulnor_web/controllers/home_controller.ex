defmodule RaulnorWeb.HomeController do
  use RaulnorWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :index,
      layout: false,
      source:
        RaulnorWeb.CoreComponents.source_href("lib/raulnor_web/controllers/home_controller.ex")
    )
  end
end
