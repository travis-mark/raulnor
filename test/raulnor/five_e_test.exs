defmodule Raulnor.FiveETest do
  use Raulnor.DataCase

  alias Raulnor.FiveE

  describe "characters" do
    alias Raulnor.FiveE.Character

    import Raulnor.FiveEFixtures

    @invalid_attrs %{name: nil, class: nil}

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert FiveE.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert FiveE.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      valid_attrs = %{name: "some name", class: 1}

      assert {:ok, %Character{} = character} = FiveE.create_character(valid_attrs)
      assert character.name == "some name"
      assert character.class == 1
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FiveE.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      update_attrs = %{name: "some updated name", class: 2}

      assert {:ok, %Character{} = character} = FiveE.update_character(character, update_attrs)
      assert character.name == "some updated name"
      assert character.class == 2
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = FiveE.update_character(character, @invalid_attrs)
      assert character == FiveE.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = FiveE.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> FiveE.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = FiveE.change_character(character)
    end
  end
end
