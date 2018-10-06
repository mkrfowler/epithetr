defmodule Epithetr.WordsTest do
  use Epithetr.DataCase

  alias Epithetr.Words

  describe "nouns" do
    alias Epithetr.Words.Noun

    @valid_attrs %{word: "some word", wholesome: false}
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

  describe "descriptors" do
    alias Epithetr.Words.Descriptor

    @valid_attrs %{word: "some word", wholesome: false}
    @update_attrs %{word: "some updated word"}
    @invalid_attrs %{word: nil}

    def descriptor_fixture(attrs \\ %{}) do
      {:ok, descriptor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Words.create_descriptor()

      descriptor
    end

    test "list_descriptors/0 returns all descriptors" do
      descriptor = descriptor_fixture()
      assert Words.list_descriptors() == [descriptor]
    end

    test "get_descriptor!/1 returns the descriptor with given id" do
      descriptor = descriptor_fixture()
      assert Words.get_descriptor!(descriptor.id) == descriptor
    end

    test "create_descriptor/1 with valid data creates a descriptor" do
      assert {:ok, %Descriptor{} = descriptor} = Words.create_descriptor(@valid_attrs)
      assert descriptor.word == "some word"
    end

    test "create_descriptor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_descriptor(@invalid_attrs)
    end

    test "update_descriptor/2 with valid data updates the descriptor" do
      descriptor = descriptor_fixture()
      assert {:ok, descriptor} = Words.update_descriptor(descriptor, @update_attrs)
      assert %Descriptor{} = descriptor
      assert descriptor.word == "some updated word"
    end

    test "update_descriptor/2 with invalid data returns error changeset" do
      descriptor = descriptor_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_descriptor(descriptor, @invalid_attrs)
      assert descriptor == Words.get_descriptor!(descriptor.id)
    end

    test "delete_descriptor/1 deletes the descriptor" do
      descriptor = descriptor_fixture()
      assert {:ok, %Descriptor{}} = Words.delete_descriptor(descriptor)
      assert_raise Ecto.NoResultsError, fn -> Words.get_descriptor!(descriptor.id) end
    end

    test "change_descriptor/1 returns a descriptor changeset" do
      descriptor = descriptor_fixture()
      assert %Ecto.Changeset{} = Words.change_descriptor(descriptor)
    end
  end
end
