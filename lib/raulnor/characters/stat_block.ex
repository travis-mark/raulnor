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
  end

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
end
