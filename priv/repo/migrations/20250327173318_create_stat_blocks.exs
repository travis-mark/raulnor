defmodule Raulnor.Repo.Migrations.CreateStatBlocks do
  use Ecto.Migration

  def change do
    create table(:stat_blocks) do
      add :name, :string
      add :habitat, :string
      add :size, :string
      add :type, :string
      add :tag, :string
      add :alignment, :string
      add :ac, :integer
      add :initiative, :integer
      add :maxhp, :integer
      add :speed, :string
      add :xp, :integer
      add :str, :integer
      add :con, :integer
      add :dex, :integer
      add :wis, :integer
      add :int, :integer
      add :cha, :integer
      add :saves, :string
      add :detail, :string

      timestamps(type: :utc_datetime)
    end
  end
end
