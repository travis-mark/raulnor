defmodule RaulnorWeb.StatBlockControllerTest do
  use RaulnorWeb.ConnCase

  import Raulnor.CharactersFixtures

  @create_attrs %{
    ac: 42,
    name: "some name",
    size: "some size",
    tag: "some tag",
    type: "some type",
    int: 10,
    speed: "some speed",
    str: 10,
    alignment: "some alignment",
    habitat: "some habitat",
    initiative: 42,
    maxhp: 42,
    xp: 42,
    con: 10,
    dex: 10,
    wis: 10,
    cha: 10,
    saves: "some saves",
    detail: "some detail"
  }
  @update_attrs %{
    ac: 43,
    name: "some updated name",
    size: "some updated size",
    tag: "some updated tag",
    type: "some updated type",
    int: 10,
    speed: "some updated speed",
    str: 10,
    alignment: "some updated alignment",
    habitat: "some updated habitat",
    initiative: 43,
    maxhp: 43,
    xp: 43,
    con: 10,
    dex: 10,
    wis: 10,
    cha: 10,
    saves: "some updated saves",
    detail: "some updated detail"
  }
  @invalid_attrs %{
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

  describe "index" do
    test "lists all stat_blocks", %{conn: conn} do
      conn = get(conn, ~p"/stat_blocks")
      assert html_response(conn, 200) =~ "Listing Stat blocks"
    end
  end

  describe "new stat_block" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/stat_blocks/new")
      assert html_response(conn, 200) =~ "New Stat block"
    end
  end

  describe "create stat_block" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/stat_blocks", stat_block: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/stat_blocks/#{id}"

      conn = get(conn, ~p"/stat_blocks/#{id}")
      # Changed from "Stat block #{id}"
      assert html_response(conn, 200) =~ "STR"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/stat_blocks", stat_block: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Stat block"
    end
  end

  describe "edit stat_block" do
    setup [:create_stat_block]

    test "renders form for editing chosen stat_block", %{conn: conn, stat_block: stat_block} do
      conn = get(conn, ~p"/stat_blocks/#{stat_block}/edit")
      assert html_response(conn, 200) =~ "Edit Stat block"
    end
  end

  describe "update stat_block" do
    setup [:create_stat_block]

    test "redirects when data is valid", %{conn: conn, stat_block: stat_block} do
      conn = put(conn, ~p"/stat_blocks/#{stat_block}", stat_block: @update_attrs)
      assert redirected_to(conn) == ~p"/stat_blocks/#{stat_block}"

      conn = get(conn, ~p"/stat_blocks/#{stat_block}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, stat_block: stat_block} do
      conn = put(conn, ~p"/stat_blocks/#{stat_block}", stat_block: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Stat block"
    end
  end

  describe "delete stat_block" do
    setup [:create_stat_block]

    test "deletes chosen stat_block", %{conn: conn, stat_block: stat_block} do
      conn = delete(conn, ~p"/stat_blocks/#{stat_block}")
      assert redirected_to(conn) == ~p"/stat_blocks"

      assert_error_sent 404, fn ->
        get(conn, ~p"/stat_blocks/#{stat_block}")
      end
    end
  end

  defp create_stat_block(_) do
    stat_block = stat_block_fixture()
    %{stat_block: stat_block}
  end
end
