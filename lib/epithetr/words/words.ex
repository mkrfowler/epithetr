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

  alias Epithetr.Words.Descriptor

  def random_descriptors(limit, wholesome) do
    query = from descriptor in Descriptor,
      order_by: [desc: fragment("RANDOM()")],
      where: descriptor.wholesome == ^wholesome,
      limit: ^limit

    query
    |> Repo.all()
  end

  def random_descriptors(limit) do
    query = from descriptor in Descriptor,
      order_by: [desc: fragment("RANDOM()")],
      limit: ^limit

    query
    |> Repo.all()
  end

  @doc """
  Returns the list of descriptors.

  ## Examples

      iex> list_descriptors()
      [%Descriptor{}, ...]

  """
  def list_descriptors do
    Repo.all(Descriptor)
  end

  def filter_descriptors(wholesome \\ true) do
    from descriptor in Descriptor,
      order_by: [fragment("lower(?)", descriptor.word)],
      where: descriptor.wholesome == ^wholesome
  end

  @doc """
  Gets a single descriptor.

  Raises `Ecto.NoResultsError` if the Descriptor does not exist.

  ## Examples

      iex> get_descriptor!(123)
      %Descriptor{}

      iex> get_descriptor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_descriptor!(id), do: Repo.get!(Descriptor, id)

  @doc """
  Creates a descriptor.

  ## Examples

      iex> create_descriptor(%{field: value})
      {:ok, %Descriptor{}}

      iex> create_descriptor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_descriptor(attrs \\ %{}) do
    %Descriptor{}
    |> Descriptor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a descriptor.

  ## Examples

      iex> update_descriptor(descriptor, %{field: new_value})
      {:ok, %Descriptor{}}

      iex> update_descriptor(descriptor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_descriptor(%Descriptor{} = descriptor, attrs) do
    descriptor
    |> Descriptor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Descriptor.

  ## Examples

      iex> delete_descriptor(descriptor)
      {:ok, %Descriptor{}}

      iex> delete_descriptor(descriptor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_descriptor(%Descriptor{} = descriptor) do
    Repo.delete(descriptor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking descriptor changes.

  ## Examples

      iex> change_descriptor(descriptor)
      %Ecto.Changeset{source: %Descriptor{}}

  """
  def change_descriptor(%Descriptor{} = descriptor) do
    Descriptor.changeset(descriptor, %{})
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
