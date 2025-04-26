defmodule Raulnor.WikiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Raulnor.Wiki` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        content: "some content",
        last_edited_by: "some last_edited_by",
        slug: "some slug",
        title: "some title"
      })
      |> Raulnor.Wiki.create_page()

    page
  end
end
