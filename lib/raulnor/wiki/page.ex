defmodule Raulnor.Wiki.Page do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

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
    |> validate_required([:title, :content, :last_edited_by])
    |> generate_slug()
  end

  defp generate_slug(%Ecto.Changeset{valid?: true, changes: %{title: title}} = changeset) do
    slug = title
           |> String.downcase()
           |> String.replace(~r/[^a-z0-9\s-]/, "")
           |> String.replace(~r/\s+/, "-")
    put_change(changeset, :slug, slug)
  end

  defp generate_slug(changeset), do: changeset
end
