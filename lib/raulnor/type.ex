defmodule Raulnor.Types do
  use Raulnor.Choices
  def all() do
    [
      {"", ""},
      {"Abberation", "A"},
      {"Beast", "B"},
      {"Celestial", "C"},
      {"Construct", "R"},
      {"Dragon", "D"},
      {"Elemental", "E"},
      {"Fey", "F"},
      {"Fiend", "I"},
      {"Giant", "G"},
      {"Humanoid", "H"},
      {"Monstrosity", "M"},
      {"Ooze", "O"},
      {"Plant", "P"},
      {"Undead", "U"}
    ]
  end
end
