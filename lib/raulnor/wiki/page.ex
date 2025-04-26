defmodule Raulnor.Wiki.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :title, :string
    field :content, :string
    field :slug, :string
    field :last_edited_by, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :content, :slug, :last_edited_by])
    |> validate_required([:title, :content, :slug, :last_edited_by])
  end
end
