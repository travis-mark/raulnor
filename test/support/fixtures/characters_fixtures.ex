defmodule Raulnor.CharactersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Raulnor.Characters` context.
  """

  @doc """
  Generate a stat_block.
  """
  def stat_block_fixture(attrs \\ %{}) do
    {:ok, stat_block} =
      attrs
      |> Enum.into(%{
        ac: 42,
        alignment: "some alignment",
        cha: 42,
        con: 42,
        detail: "some detail",
        dex: 42,
        habitat: "some habitat",
        initiative: 42,
        int: 42,
        maxhp: 42,
        name: "some name",
        saves: "some saves",
        size: "some size",
        speed: "some speed",
        str: 42,
        tag: "some tag",
        type: "some type",
        wis: 42,
        xp: 42
      })
      |> Raulnor.Characters.create_stat_block()

    stat_block
  end
end
