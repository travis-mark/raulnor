defmodule Raulnor.CharactersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Raulnor.Characters` context.
  """

  @doc """
  Sample attributes for a valid monster
  """
  def gravedirt_queen_create_attrs() do
    %{
      ac: 13,
      alignment: "NE",
      cha: 15,
      con: 16,
      detail: "",
      dex: 18,
      habitat: "Forest",
      initiative: 14,
      int: 16,
      maxhp: 247,
      name: "Gravedirt Queen",
      saves: "DEX;WIS",
      size: "M",
      speed: "0 ft., fly 60 ft. (hover)",
      str: 6,
      tag: "",
      type: "U",
      wis: 17,
      xp: 8400
    }
  end

  @doc """
  Invalid attributes to test for errors
  """
  def invalid_attrs() do
    %{
      ac: nil,
      name: nil,
      size: nil,
      tag: nil,
      type: nil,
      int: nil,
      speed: nil,
      str: nil,
      alignment: nil,
      habitat: nil,
      initiative: nil,
      maxhp: nil,
      xp: nil,
      con: nil,
      dex: nil,
      wis: nil,
      cha: nil,
      saves: nil,
      detail: nil
    }
  end

  @doc """
  Sample attributes to update a monster (adjust difficulty)
  """
  def gravedirt_queen_update_attrs() do
    %{
      maxhp: 165,
      xp: 2900
    }
  end

  @doc """
  Generate a stat_block.
  """
  def stat_block_fixture(attrs \\ %{}) do
    {:ok, stat_block} =
      attrs
      |> Enum.into(gravedirt_queen_create_attrs())
      |> Raulnor.Characters.create_stat_block()

    stat_block
  end
end
