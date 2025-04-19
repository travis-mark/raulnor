defmodule Phb do
  @doc """
  ROUND DOWN
  Player's Handbook, page 8

  Whenever you divide or multiply a number in the game,
  round down if you end up with a fraction,
  even if the fraction is one-half or greater.
  Some rules make an exception and tell you to round up.

  ## Examples
  iex> Phb.round_damage(13.5)
  13
  iex> Phb.round_damage({13.5, :necrotic})
  13
  """
  def round_damage(damage) when is_number(damage) do
    floor(damage)
  end

  def round_damage({damage, _type}) do
    floor(damage)
  end
end
