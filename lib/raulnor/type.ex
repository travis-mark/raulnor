defmodule Raulnor.Types do
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

  def values() do
    Enum.map(all(), fn {_, v} -> v end)
  end

  def list_for_select() do
    all()
  end

  def text_for_value(value) do
    {text, _} = Enum.find(all(), fn {_, v} -> v == value end)
    text
  end
end
