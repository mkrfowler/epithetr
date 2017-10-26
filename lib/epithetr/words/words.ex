defmodule Epithetr.Words do
  @moduledoc """
  The Words context.
  """

  import Ecto.Query, warn: false
  alias Epithetr.Repo

  alias Epithetr.Words.Noun

  @doc """
  Returns the list of nouns.

  ## Examples

      iex> list_nouns()
      [%Noun{}, ...]

  """
  def list_nouns do
    Repo.all(Noun)
  end

  @doc """
  Gets a single noun.

  Raises `Ecto.NoResultsError` if the Noun does not exist.

  ## Examples

      iex> get_noun!(123)
      %Noun{}

      iex> get_noun!(456)
      ** (Ecto.NoResultsError)

  """
  def get_noun!(id), do: Repo.get!(Noun, id)

  @doc """
  Creates a noun.

  ## Examples

      iex> create_noun(%{field: value})
      {:ok, %Noun{}}

      iex> create_noun(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_noun(attrs \\ %{}) do
    %Noun{}
    |> Noun.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a noun.

  ## Examples

      iex> update_noun(noun, %{field: new_value})
      {:ok, %Noun{}}

      iex> update_noun(noun, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_noun(%Noun{} = noun, attrs) do
    noun
    |> Noun.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Noun.

  ## Examples

      iex> delete_noun(noun)
      {:ok, %Noun{}}

      iex> delete_noun(noun)
      {:error, %Ecto.Changeset{}}

  """
  def delete_noun(%Noun{} = noun) do
    Repo.delete(noun)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking noun changes.

  ## Examples

      iex> change_noun(noun)
      %Ecto.Changeset{source: %Noun{}}

  """
  def change_noun(%Noun{} = noun) do
    Noun.changeset(noun, %{})
  end
end
