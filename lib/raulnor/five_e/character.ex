defmodule Raulnor.FiveE.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    field :class, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :class])
    |> validate_required([:name])
    |> validate_inclusion(:class, Raulnor.FiveE.Class.values())
  end
end
