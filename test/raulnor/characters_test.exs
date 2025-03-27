defmodule Raulnor.CharactersTest do
  use Raulnor.DataCase

  alias Raulnor.Characters

  describe "stat_blocks" do
    alias Raulnor.Characters.StatBlock

    import Raulnor.CharactersFixtures

    @invalid_attrs %{ac: nil, name: nil, size: nil, tag: nil, type: nil, int: nil, speed: nil, str: nil, alignment: nil, habitat: nil, initiative: nil, maxhp: nil, xp: nil, con: nil, dex: nil, wis: nil, cha: nil, saves: nil, detail: nil}

    test "list_stat_blocks/0 returns all stat_blocks" do
      stat_block = stat_block_fixture()
      assert Characters.list_stat_blocks() == [stat_block]
    end

    test "get_stat_block!/1 returns the stat_block with given id" do
      stat_block = stat_block_fixture()
      assert Characters.get_stat_block!(stat_block.id) == stat_block
    end

    test "create_stat_block/1 with valid data creates a stat_block" do
      valid_attrs = %{ac: 42, name: "some name", size: "some size", tag: "some tag", type: "some type", int: 42, speed: "some speed", str: 42, alignment: "some alignment", habitat: "some habitat", initiative: 42, maxhp: 42, xp: 42, con: 42, dex: 42, wis: 42, cha: 42, saves: "some saves", detail: "some detail"}

      assert {:ok, %StatBlock{} = stat_block} = Characters.create_stat_block(valid_attrs)
      assert stat_block.ac == 42
      assert stat_block.name == "some name"
      assert stat_block.size == "some size"
      assert stat_block.tag == "some tag"
      assert stat_block.type == "some type"
      assert stat_block.int == 42
      assert stat_block.speed == "some speed"
      assert stat_block.str == 42
      assert stat_block.alignment == "some alignment"
      assert stat_block.habitat == "some habitat"
      assert stat_block.initiative == 42
      assert stat_block.maxhp == 42
      assert stat_block.xp == 42
      assert stat_block.con == 42
      assert stat_block.dex == 42
      assert stat_block.wis == 42
      assert stat_block.cha == 42
      assert stat_block.saves == "some saves"
      assert stat_block.detail == "some detail"
    end

    test "create_stat_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_stat_block(@invalid_attrs)
    end

    test "update_stat_block/2 with valid data updates the stat_block" do
      stat_block = stat_block_fixture()
      update_attrs = %{ac: 43, name: "some updated name", size: "some updated size", tag: "some updated tag", type: "some updated type", int: 43, speed: "some updated speed", str: 43, alignment: "some updated alignment", habitat: "some updated habitat", initiative: 43, maxhp: 43, xp: 43, con: 43, dex: 43, wis: 43, cha: 43, saves: "some updated saves", detail: "some updated detail"}

      assert {:ok, %StatBlock{} = stat_block} = Characters.update_stat_block(stat_block, update_attrs)
      assert stat_block.ac == 43
      assert stat_block.name == "some updated name"
      assert stat_block.size == "some updated size"
      assert stat_block.tag == "some updated tag"
      assert stat_block.type == "some updated type"
      assert stat_block.int == 43
      assert stat_block.speed == "some updated speed"
      assert stat_block.str == 43
      assert stat_block.alignment == "some updated alignment"
      assert stat_block.habitat == "some updated habitat"
      assert stat_block.initiative == 43
      assert stat_block.maxhp == 43
      assert stat_block.xp == 43
      assert stat_block.con == 43
      assert stat_block.dex == 43
      assert stat_block.wis == 43
      assert stat_block.cha == 43
      assert stat_block.saves == "some updated saves"
      assert stat_block.detail == "some updated detail"
    end

    test "update_stat_block/2 with invalid data returns error changeset" do
      stat_block = stat_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Characters.update_stat_block(stat_block, @invalid_attrs)
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
