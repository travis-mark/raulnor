defmodule RaulnorWeb.StatBlockHTML do
  use RaulnorWeb, :html

  embed_templates "stat_block_html/*"

  @doc """
  Renders a stat_block form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def stat_block_form(assigns)

  def mod(stat_block, stat) do
    Raulnor.Characters.StatBlock.ability_modifier(stat_block, stat)
  end

  def save(stat_block, stat) do
    Raulnor.Characters.StatBlock.ability_save(stat_block, stat)
  end

  def alignment(abbrev), do: Raulnor.Alignment.text_for_value(abbrev)
  def size(abbrev), do: Raulnor.Sizes.text_for_value(abbrev)
  def type(abbrev), do: Raulnor.Types.text_for_value(abbrev)
end
