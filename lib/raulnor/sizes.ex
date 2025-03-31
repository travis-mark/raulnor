defmodule Raulnor.Sizes do
  def all() do
    [
      {"", ""},
      {"Tiny", "T"},
      {"Small", "S"},
      {"Medium", "M"},
      {"Large", "L"},
      {"Huge", "H"},
      {"Gargantuan", "G"}
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
