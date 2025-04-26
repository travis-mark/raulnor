defmodule Raulnor.WikiTest do
  use Raulnor.DataCase

  alias Raulnor.Wiki

  describe "pages" do
    alias Raulnor.Wiki.Page

    import Raulnor.WikiFixtures

    @invalid_attrs %{title: nil, content: nil, slug: nil, last_edited_by: nil}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Wiki.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Wiki.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      valid_attrs = %{title: "some title", content: "some content", slug: "some slug", last_edited_by: "some last_edited_by"}

      assert {:ok, %Page{} = page} = Wiki.create_page(valid_attrs)
      assert page.title == "some title"
      assert page.content == "some content"
      assert page.slug == "some slug"
      assert page.last_edited_by == "some last_edited_by"
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wiki.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{title: "some updated title", content: "some updated content", slug: "some updated slug", last_edited_by: "some updated last_edited_by"}

      assert {:ok, %Page{} = page} = Wiki.update_page(page, update_attrs)
      assert page.title == "some updated title"
      assert page.content == "some updated content"
      assert page.slug == "some updated slug"
      assert page.last_edited_by == "some updated last_edited_by"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Wiki.update_page(page, @invalid_attrs)
      assert page == Wiki.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Wiki.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Wiki.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Wiki.change_page(page)
    end
  end
end
