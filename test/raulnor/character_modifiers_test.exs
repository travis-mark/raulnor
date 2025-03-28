defmodule Raulnor.CharacterModifiersTest do
  use Raulnor.DataCase

  import Raulnor.CharactersFixtures
  import Raulnor.Characters.StatBlock

  setup do
    venzyre =
      stat_block_fixture(%{
        ac: 16,
        alignment: "NE",
        cha: 11,
        con: 16,
        detail: "Not Required",
        dex: 16,
        habitat: "Not Required",
        initiative: 13,
        int: 15,
        maxhp: 45,
        name: "Venzyre Ironbell",
        saves: "STR;CON",
        size: "S",
        speed: "30",
        str: 18,
        tag: "Player Characters",
        type: "H",
        wis: 14,
        xp: 2700
      })

    %{venzyre: venzyre}
  end

  describe "modifiers" do
    test "compute modifiers", %{venzyre: venzyre} do
      assert ability_modifier(venzyre, :str) == 4
      assert ability_modifier(venzyre, :con) == 3
      assert ability_modifier(venzyre, :dex) == 3
      assert ability_modifier(venzyre, :wis) == 2
      assert ability_modifier(venzyre, :int) == 2
      assert ability_modifier(venzyre, :cha) == 0
    end

    test "compute saves", %{venzyre: venzyre} do
      assert ability_save(venzyre, :str) == 6
      assert ability_save(venzyre, :con) == 5
      assert ability_save(venzyre, :dex) == 3
      assert ability_save(venzyre, :wis) == 2
      assert ability_save(venzyre, :int) == 2
      assert ability_save(venzyre, :cha) == 0
    end
  end
end
