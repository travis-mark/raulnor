defmodule RaulnorWeb.PageController do
  use RaulnorWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home,
      layout: false,
      source:
        RaulnorWeb.CoreComponents.source_href("lib/raulnor_web/controllers/page_controller.ex")
    )
  end
end
