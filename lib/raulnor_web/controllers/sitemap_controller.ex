defmodule RaulnorWeb.SitemapController do
  use RaulnorWeb, :controller

  def index(conn, _params) do
    routes = RaulnorWeb.Router.__routes__()
    |> IO.inspect()
    |> Enum.filter(fn route ->
      :get == route.verb and
      not String.contains?(route.path, ":") and
      not String.contains?(route.path, "/new")
    end)
    |> Enum.map(fn route -> route.path end)
    render(conn, :index,
      routes: routes,
      source: RaulnorWeb.CoreComponents.source_href("lib/raulnor_web/controllers/sitemap_controller.ex"))
  end
end
