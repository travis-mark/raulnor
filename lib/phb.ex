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

  @doc """
  Rolls dice based on standard dice notation like "2d6", "1d20+3", etc.

  ## Examples:

  - "1d6+2" rolls one 6-sided die and adds 2
  - "3d4" rolls three 4-sided dice
  """
  def read_dice(notation) when is_binary(notation) do
    case Regex.run(~r/(\d+)d(\d+)(\+\d+)?/, notation) do
      [_, dice, sides, bonus] ->
        {String.to_integer(dice), String.to_integer(sides), String.to_integer(bonus)}

      [_, dice, sides] ->
        {String.to_integer(dice), String.to_integer(sides), 0}
    end
  end

  defmacro sigil_d({_, _, [string]}, _modifiers) do
    {dice, sides, bonus} = read_dice(string)

    quote do
      {unquote(dice), unquote(sides), unquote(bonus)}
    end
  end

  def roll_random({dice, sides, bonus}) do
    bonus + (1..dice |> Enum.map(fn _ -> :rand.uniform(sides) end) |> Enum.sum())
  end

  @doc """
  Return the average roll for a dice set.

  ## Examples:

      iex> Phb.roll_average(~d"1d4")
      2

      iex> Phb.roll_average(~d"2d6")
      7

      iex> Phb.roll_average(~d"1d20")
      10

      iex> Phb.roll_average(~d"8d8+8")
      44
  """
  def roll_average({dice, sides, bonus}) do
    bonus + floor(dice * (sides + 1) / 2)
  end
end
