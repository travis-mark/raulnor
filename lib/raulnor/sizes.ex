defmodule Raulnor.Sizes do
  use Raulnor.Choices

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
end
