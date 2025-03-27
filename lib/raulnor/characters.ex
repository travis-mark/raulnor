defmodule Raulnor.Characters do
  @moduledoc """
  The Characters context.
  """

  import Ecto.Query, warn: false
  alias Raulnor.Repo

  alias Raulnor.Characters.StatBlock

  @doc """
  Returns the list of stat_blocks.

  ## Examples

      iex> list_stat_blocks()
      [%StatBlock{}, ...]

  """
  def list_stat_blocks do
    Repo.all(StatBlock)
  end

  @doc """
  Gets a single stat_block.

  Raises `Ecto.NoResultsError` if the Stat block does not exist.

  ## Examples

      iex> get_stat_block!(123)
      %StatBlock{}

      iex> get_stat_block!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stat_block!(id), do: Repo.get!(StatBlock, id)

  @doc """
  Creates a stat_block.

  ## Examples

      iex> create_stat_block(%{field: value})
      {:ok, %StatBlock{}}

      iex> create_stat_block(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stat_block(attrs \\ %{}) do
    %StatBlock{}
    |> StatBlock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stat_block.

  ## Examples

      iex> update_stat_block(stat_block, %{field: new_value})
      {:ok, %StatBlock{}}

      iex> update_stat_block(stat_block, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stat_block(%StatBlock{} = stat_block, attrs) do
    stat_block
    |> StatBlock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stat_block.

  ## Examples

      iex> delete_stat_block(stat_block)
      {:ok, %StatBlock{}}

      iex> delete_stat_block(stat_block)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stat_block(%StatBlock{} = stat_block) do
    Repo.delete(stat_block)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stat_block changes.

  ## Examples

      iex> change_stat_block(stat_block)
      %Ecto.Changeset{data: %StatBlock{}}

  """
  def change_stat_block(%StatBlock{} = stat_block, attrs \\ %{}) do
    StatBlock.changeset(stat_block, attrs)
  end
end
