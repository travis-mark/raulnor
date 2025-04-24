defmodule RaulnorWeb.SitemapHTML do
  use RaulnorWeb, :html

  def index(assigns) do
    ~H"""
    <div class="sitemap">
      <%= for route <- @routes do %>
        <div class="sitemap-item">
          <a href={route}><%= route %></a>
        </div>
      <% end %>
    </div>
    """
  end
end
