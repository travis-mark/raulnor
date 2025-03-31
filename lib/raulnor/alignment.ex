defmodule Raulnor.Alignment do
  use Raulnor.Choices

  def all() do
    [
      {"", ""},
      {"Lawful Good", "LG"},
      {"Neutral Good", "NG"},
      {"Chaotic Good", "CG"},
      {"Lawful Neutral", "LN"},
      {"True Neutral", "TN"},
      {"Chaotic Neutral", "CN"},
      {"Lawful Evil", "LE"},
      {"Neutral Evil", "NE"},
      {"Chaotic Evil", "CE"}
    ]
  end
end
