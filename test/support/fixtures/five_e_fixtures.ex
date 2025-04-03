defmodule Raulnor.FiveEFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Raulnor.FiveE` context.
  """

  @doc """
  Generate a character.
  """
  def character_fixture(attrs \\ %{}) do
    {:ok, character} =
      attrs
      |> Enum.into(%{
        class: 1,
        name: "some name"
      })
      |> Raulnor.FiveE.create_character()

    character
  end
end
