defmodule Epithetr.WordTest do
  use Epithetr.DataCase

  alias Epithetr.Word

  describe "sentences" do
    alias Epithetr.Word.Sentence

    @valid_attrs %{body: "some body", wholesome: true}
    @update_attrs %{body: "some updated body", wholesome: false}
    @invalid_attrs %{body: nil, wholesome: nil}

    def sentence_fixture(attrs \\ %{}) do
      {:ok, sentence} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Word.create_sentence()

      sentence
    end

    test "list_sentences/0 returns all sentences" do
      sentence = sentence_fixture()
      assert Word.list_sentences() == [sentence]
    end

    test "get_sentence!/1 returns the sentence with given id" do
      sentence = sentence_fixture()
      assert Word.get_sentence!(sentence.id) == sentence
    end

    test "create_sentence/1 with valid data creates a sentence" do
      assert {:ok, %Sentence{} = sentence} = Word.create_sentence(@valid_attrs)
      assert sentence.body == "some body"
      assert sentence.wholesome == true
    end

    test "create_sentence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Word.create_sentence(@invalid_attrs)
    end

    test "update_sentence/2 with valid data updates the sentence" do
      sentence = sentence_fixture()
      assert {:ok, sentence} = Word.update_sentence(sentence, @update_attrs)
      assert %Sentence{} = sentence
      assert sentence.body == "some updated body"
      assert sentence.wholesome == false
    end

    test "update_sentence/2 with invalid data returns error changeset" do
      sentence = sentence_fixture()
      assert {:error, %Ecto.Changeset{}} = Word.update_sentence(sentence, @invalid_attrs)
      assert sentence == Word.get_sentence!(sentence.id)
    end

    test "delete_sentence/1 deletes the sentence" do
      sentence = sentence_fixture()
      assert {:ok, %Sentence{}} = Word.delete_sentence(sentence)
      assert_raise Ecto.NoResultsError, fn -> Word.get_sentence!(sentence.id) end
    end

    test "change_sentence/1 returns a sentence changeset" do
      sentence = sentence_fixture()
      assert %Ecto.Changeset{} = Word.change_sentence(sentence)
    end
  end
end
