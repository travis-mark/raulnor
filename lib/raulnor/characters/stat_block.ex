defmodule Raulnor.Characters.StatBlock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stat_blocks" do
    field :ac, :integer
    field :name, :string
    field :size, :string
    field :tag, :string
    field :type, :string
    field :int, :integer
    field :speed, :string
    field :str, :integer
    field :alignment, :string
    field :habitat, :string
    field :initiative, :integer
    field :maxhp, :integer
    field :xp, :integer
    field :con, :integer
    field :dex, :integer
    field :wis, :integer
    field :cha, :integer
    field :saves, :string
    field :detail, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(stat_block, attrs) do
    stat_block
    |> cast(attrs, [
      :name,
      :habitat,
      :size,
      :type,
      :tag,
      :alignment,
      :ac,
      :initiative,
      :maxhp,
      :speed,
      :xp,
      :str,
      :con,
      :dex,
      :wis,
      :int,
      :cha,
      :saves,
      :detail
    ])
    |> validate_required([
      :name,
      :size,
      :type,
      :alignment,
      :ac,
      :initiative,
      :maxhp,
      :speed,
      :xp,
      :str,
      :con,
      :dex,
      :wis,
      :int,
      :cha,
      :saves
    ])
    |> validate_inclusion(:size, Raulnor.Sizes.values())
    |> validate_inclusion(:type, Raulnor.Types.values())
    |> validate_inclusion(:str, 1..30)
    |> validate_inclusion(:con, 1..30)
    |> validate_inclusion(:dex, 1..30)
    |> validate_inclusion(:wis, 1..30)
    |> validate_inclusion(:int, 1..30)
    |> validate_inclusion(:cha, 1..30)
  end

  @spec ability_modifier(any(), :cha | :con | :dex | :int | :str | :wis) :: integer()
  def ability_modifier(stat_block, :str), do: ability_modifier(stat_block.str)
  def ability_modifier(stat_block, :con), do: ability_modifier(stat_block.con)
  def ability_modifier(stat_block, :dex), do: ability_modifier(stat_block.dex)
  def ability_modifier(stat_block, :wis), do: ability_modifier(stat_block.wis)
  def ability_modifier(stat_block, :int), do: ability_modifier(stat_block.int)
  def ability_modifier(stat_block, :cha), do: ability_modifier(stat_block.cha)

  def ability_modifier(score) when is_integer(score) do
    case score do
      1 -> -5
      2 -> -4
      3 -> -4
      4 -> -3
      5 -> -3
      6 -> -2
      7 -> -2
      8 -> -1
      9 -> -1
      10 -> 0
      11 -> 0
      12 -> 1
      13 -> 1
      14 -> 2
      15 -> 2
      16 -> 3
      17 -> 3
      18 -> 4
      19 -> 4
      20 -> 5
      21 -> 5
      22 -> 6
      23 -> 6
      24 -> 7
      25 -> 7
      26 -> 8
      27 -> 8
      28 -> 9
      29 -> 9
      30 -> 10
      _ -> raise "Invalid ability score: #{score}, must be between 1 and 30"
    end
  end

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

  def save_proficiency(%{saves: saves} = _stat_block, stat) do
    case stat do
      :str -> saves =~ "STR"
      :con -> saves =~ "CON"
      :dex -> saves =~ "DEX"
      :wis -> saves =~ "WIS"
      :int -> saves =~ "INT"
      :cha -> saves =~ "CHA"
      _ -> false
    end
  end

  def ability_save(stat_block, stat) do
    if save_proficiency(stat_block, stat) do
      ability_modifier(stat_block, stat) + proficiency_bonus(stat_block)
    else
      ability_modifier(stat_block, stat)
    end
  end
end
