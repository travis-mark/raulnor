defmodule Raulnor.FiveE.Class do
  @moduledoc """
    List of 5E Character Classes.

    NOTE: This may move to a database table to support campaigns / source.
  """
  use Raulnor.Choices

  def all() do
    [
      {"", ""},
      {"Barbarian", 1},
      {"Bard", 2},
      {"Cleric", 3},
      {"Druid", 4},
      {"Fighter", 5},
      {"Monk", 6},
      {"Paladin", 7},
      {"Ranger", 8},
      {"Rogue", 9},
      {"Sorceror", 10},
      {"Warlock", 11},
      {"Wizard", 12}
    ]
  end
end
