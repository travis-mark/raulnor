defmodule Raulnor.Characters.Advancement do
  def proficiency_bonus(%{xp: xp} = _stat_block) do
    cond do
      # Levels 1-4
      xp < 6_500 -> 2
      # Levels 5-8
      xp < 48_000 -> 3
      # Levels 9-12
      xp < 120_000 -> 4
      # Levels 13-16
      xp < 225_000 -> 5
      # Levels 17-20
      true -> 6
    end
  end
end
