defmodule RaulnorWeb.PageHTML do
  use RaulnorWeb, :html

  embed_templates "page_html/*"

  @doc """
  Renders a page form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def page_form(assigns)
end
