defmodule RaulnorWeb.StatBlockHTML do
  use RaulnorWeb, :html

  embed_templates "stat_block_html/*"

  @doc """
  Renders a stat_block form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :sizes, :list

  def stat_block_form(assigns)

  def mod(stat_block, stat) do
    Raulnor.Characters.StatBlock.ability_modifier(stat_block, stat)
  end

  def save(stat_block, stat) do
    Raulnor.Characters.StatBlock.ability_save(stat_block, stat)
  end

  def size(abbrev) do
    sizes = Raulnor.Characters.StatBlock.sizes()
    case Enum.find(sizes, fn {_name, code} -> code == abbrev end) do
      {name, _code} -> name
      nil -> nil
    end
  end
end
