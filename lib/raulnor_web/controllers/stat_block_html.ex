defmodule RaulnorWeb.StatBlockHTML do
  use RaulnorWeb, :html

  embed_templates "stat_block_html/*"

  @doc """
  Renders a stat_block form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def stat_block_form(assigns)
end
