defmodule Epithetr.WordsTest do
  use Epithetr.DataCase

  alias Epithetr.Words

  describe "nouns" do
    alias Epithetr.Words.Noun

    @valid_attrs %{word: "some word"}
    @update_attrs %{word: "some updated word"}
    @invalid_attrs %{word: nil}

    def noun_fixture(attrs \\ %{}) do
      {:ok, noun} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Words.create_noun()

      noun
    end

    test "list_nouns/0 returns all nouns" do
      noun = noun_fixture()
      assert Words.list_nouns() == [noun]
    end

    test "get_noun!/1 returns the noun with given id" do
      noun = noun_fixture()
      assert Words.get_noun!(noun.id) == noun
    end

    test "create_noun/1 with valid data creates a noun" do
      assert {:ok, %Noun{} = noun} = Words.create_noun(@valid_attrs)
      assert noun.word == "some word"
    end

    test "create_noun/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_noun(@invalid_attrs)
    end

    test "update_noun/2 with valid data updates the noun" do
      noun = noun_fixture()
      assert {:ok, noun} = Words.update_noun(noun, @update_attrs)
      assert %Noun{} = noun
      assert noun.word == "some updated word"
    end

    test "update_noun/2 with invalid data returns error changeset" do
      noun = noun_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_noun(noun, @invalid_attrs)
      assert noun == Words.get_noun!(noun.id)
    end

    test "delete_noun/1 deletes the noun" do
      noun = noun_fixture()
      assert {:ok, %Noun{}} = Words.delete_noun(noun)
      assert_raise Ecto.NoResultsError, fn -> Words.get_noun!(noun.id) end
    end

    test "change_noun/1 returns a noun changeset" do
      noun = noun_fixture()
      assert %Ecto.Changeset{} = Words.change_noun(noun)
    end
  end

  describe "adjectives" do
    alias Epithetr.Words.Adjective

    @valid_attrs %{word: "some word"}
    @update_attrs %{word: "some updated word"}
    @invalid_attrs %{word: nil}

    def adjective_fixture(attrs \\ %{}) do
      {:ok, adjective} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Words.create_adjective()

      adjective
    end

    test "list_adjectives/0 returns all adjectives" do
      adjective = adjective_fixture()
      assert Words.list_adjectives() == [adjective]
    end

    test "get_adjective!/1 returns the adjective with given id" do
      adjective = adjective_fixture()
      assert Words.get_adjective!(adjective.id) == adjective
    end

    test "create_adjective/1 with valid data creates a adjective" do
      assert {:ok, %Adjective{} = adjective} = Words.create_adjective(@valid_attrs)
      assert adjective.word == "some word"
    end

    test "create_adjective/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_adjective(@invalid_attrs)
    end

    test "update_adjective/2 with valid data updates the adjective" do
      adjective = adjective_fixture()
      assert {:ok, adjective} = Words.update_adjective(adjective, @update_attrs)
      assert %Adjective{} = adjective
      assert adjective.word == "some updated word"
    end

    test "update_adjective/2 with invalid data returns error changeset" do
      adjective = adjective_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_adjective(adjective, @invalid_attrs)
      assert adjective == Words.get_adjective!(adjective.id)
    end

    test "delete_adjective/1 deletes the adjective" do
      adjective = adjective_fixture()
      assert {:ok, %Adjective{}} = Words.delete_adjective(adjective)
      assert_raise Ecto.NoResultsError, fn -> Words.get_adjective!(adjective.id) end
    end

    test "change_adjective/1 returns a adjective changeset" do
      adjective = adjective_fixture()
      assert %Ecto.Changeset{} = Words.change_adjective(adjective)
    end
  end
end
