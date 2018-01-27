defmodule Epithetr.Word do
  @moduledoc """
  The Word context.
  """

  import Ecto.Query, warn: false
  alias Epithetr.Repo

  alias Epithetr.Word.Sentence

  @doc """
  Returns the list of sentences.

  ## Examples

      iex> list_sentences()
      [%Sentence{}, ...]

  """
  def list_sentences do
    Repo.all(Sentence)
  end

  @doc """
  Gets a single sentence.

  Raises `Ecto.NoResultsError` if the Sentence does not exist.

  ## Examples

      iex> get_sentence!(123)
      %Sentence{}

      iex> get_sentence!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sentence!(id), do: Repo.get!(Sentence, id)

  @doc """
  Creates a sentence.

  ## Examples

      iex> create_sentence(%{field: value})
      {:ok, %Sentence{}}

      iex> create_sentence(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sentence(attrs \\ %{}) do
    %Sentence{}
    |> Sentence.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sentence.

  ## Examples

      iex> update_sentence(sentence, %{field: new_value})
      {:ok, %Sentence{}}

      iex> update_sentence(sentence, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sentence(%Sentence{} = sentence, attrs) do
    sentence
    |> Sentence.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sentence.

  ## Examples

      iex> delete_sentence(sentence)
      {:ok, %Sentence{}}

      iex> delete_sentence(sentence)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sentence(%Sentence{} = sentence) do
    Repo.delete(sentence)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sentence changes.

  ## Examples

      iex> change_sentence(sentence)
      %Ecto.Changeset{source: %Sentence{}}

  """
  def change_sentence(%Sentence{} = sentence) do
    Sentence.changeset(sentence, %{})
  end
end
