defmodule Raulnor.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :class, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
