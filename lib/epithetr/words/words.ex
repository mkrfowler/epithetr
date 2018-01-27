defmodule Epithetr.Words do
  @moduledoc """
  The Words context.
  """

  import Ecto.Query, warn: false
  alias Epithetr.Repo

  alias Epithetr.Words.Noun
  alias Epithetr.Words.Sentence

  def random_nouns(limit, wholesome) do
    query = from noun in Noun,
      order_by: [desc: fragment("RANDOM()")],
      where: noun.wholesome == ^wholesome,
      limit: ^limit

    query
    |> Repo.all()
  end

  def random_nouns(limit) do
    query = from noun in Noun,
      order_by: [desc: fragment("RANDOM()")],
      limit: ^limit

    query
    |> Repo.all()
  end

  @doc """
  Returns the list of nouns.

  ## Examples

      iex> list_nouns()
      [%Noun{}, ...]

  """
  def list_nouns do
    Repo.all(Noun)
  end

  def filter_nouns(wholesome \\ true) do
    from noun in Noun,
      order_by: [fragment("lower(?)", noun.word)],
      where: noun.wholesome == ^wholesome
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

  alias Epithetr.Words.Adjective

  def random_adjectives(limit, wholesome) do
    query = from adjective in Adjective,
      order_by: [desc: fragment("RANDOM()")],
      where: adjective.wholesome == ^wholesome,
      limit: ^limit

    query
    |> Repo.all()
  end

  def random_adjectives(limit) do
    query = from adjective in Adjective,
      order_by: [desc: fragment("RANDOM()")],
      limit: ^limit

    query
    |> Repo.all()
  end

  @doc """
  Returns the list of adjectives.

  ## Examples

      iex> list_adjectives()
      [%Adjective{}, ...]

  """
  def list_adjectives do
    Repo.all(Adjective)
  end

  def filter_adjectives(wholesome \\ true) do
    from adjective in Adjective,
      order_by: [fragment("lower(?)", adjective.word)],
      where: adjective.wholesome == ^wholesome
  end

  @doc """
  Gets a single adjective.

  Raises `Ecto.NoResultsError` if the Adjective does not exist.

  ## Examples

      iex> get_adjective!(123)
      %Adjective{}

      iex> get_adjective!(456)
      ** (Ecto.NoResultsError)

  """
  def get_adjective!(id), do: Repo.get!(Adjective, id)

  @doc """
  Creates a adjective.

  ## Examples

      iex> create_adjective(%{field: value})
      {:ok, %Adjective{}}

      iex> create_adjective(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_adjective(attrs \\ %{}) do
    %Adjective{}
    |> Adjective.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a adjective.

  ## Examples

      iex> update_adjective(adjective, %{field: new_value})
      {:ok, %Adjective{}}

      iex> update_adjective(adjective, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_adjective(%Adjective{} = adjective, attrs) do
    adjective
    |> Adjective.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Adjective.

  ## Examples

      iex> delete_adjective(adjective)
      {:ok, %Adjective{}}

      iex> delete_adjective(adjective)
      {:error, %Ecto.Changeset{}}

  """
  def delete_adjective(%Adjective{} = adjective) do
    Repo.delete(adjective)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking adjective changes.

  ## Examples

      iex> change_adjective(adjective)
      %Ecto.Changeset{source: %Adjective{}}

  """
  def change_adjective(%Adjective{} = adjective) do
    Adjective.changeset(adjective, %{})
  end

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
