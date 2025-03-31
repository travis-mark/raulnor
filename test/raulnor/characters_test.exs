defmodule Raulnor.CharactersTest do
  use Raulnor.DataCase

  alias Raulnor.Characters

  describe "stat_blocks" do
    alias Raulnor.Characters.StatBlock

    import Raulnor.CharactersFixtures

    test "list_stat_blocks/0 returns all stat_blocks" do
      stat_block = stat_block_fixture()
      assert Characters.list_stat_blocks() == [stat_block]
    end

    test "get_stat_block!/1 returns the stat_block with given id" do
      stat_block = stat_block_fixture()
      assert Characters.get_stat_block!(stat_block.id) == stat_block
    end

    test "create_stat_block/1 with valid data creates a stat_block" do
      assert {:ok, _} = Characters.create_stat_block(gravedirt_queen_create_attrs())
    end

    test "create_stat_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_stat_block(invalid_attrs())
    end

    test "update_stat_block/2 with valid data updates the stat_block" do
      stat_block = stat_block_fixture()

      assert {:ok, %StatBlock{} = stat_block} =
               Characters.update_stat_block(stat_block, gravedirt_queen_update_attrs())

      assert stat_block.maxhp == 165
      assert stat_block.xp == 2900
    end

    test "Ability score min/max" do
      stat_block = stat_block_fixture()

      for ability <- [:str, :con, :dex, :wis, :int, :cha], value <- [0, 31] do
        {result, _} = Characters.update_stat_block(stat_block, Map.put(%{}, ability, value))
        assert result == :error, "Invalid value #{value} allowed for #{ability}"
      end
    end

    test "update_stat_block/2 with invalid data returns error changeset" do
      stat_block = stat_block_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Characters.update_stat_block(stat_block, invalid_attrs())

      assert stat_block == Characters.get_stat_block!(stat_block.id)
    end

    test "delete_stat_block/1 deletes the stat_block" do
      stat_block = stat_block_fixture()
      assert {:ok, %StatBlock{}} = Characters.delete_stat_block(stat_block)
      assert_raise Ecto.NoResultsError, fn -> Characters.get_stat_block!(stat_block.id) end
    end

    test "change_stat_block/1 returns a stat_block changeset" do
      stat_block = stat_block_fixture()
      assert %Ecto.Changeset{} = Characters.change_stat_block(stat_block)
    end
  end
end
