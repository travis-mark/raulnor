defmodule RaulnorWeb.CharacterHTML do
  use RaulnorWeb, :html

  embed_templates "character_html/*"

  @doc """
  Renders a character form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def character_form(assigns)

  def class(id), do: Raulnor.FiveE.Class.text_for_value(id)
end
