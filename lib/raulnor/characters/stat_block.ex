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
    |> cast(attrs, [:name, :habitat, :size, :type, :tag, :alignment, :ac, :initiative, :maxhp, :speed, :xp, :str, :con, :dex, :wis, :int, :cha, :saves, :detail])
    |> validate_required([:name, :habitat, :size, :type, :tag, :alignment, :ac, :initiative, :maxhp, :speed, :xp, :str, :con, :dex, :wis, :int, :cha, :saves, :detail])
  end
end
