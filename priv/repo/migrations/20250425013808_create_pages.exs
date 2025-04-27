defmodule Raulnor.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :title, :string, null: false
      add :content, :text
      add :slug, :string, null: false
      add :last_edited_by, :string

      timestamps(type: :utc_datetime)
    end
  end
end
