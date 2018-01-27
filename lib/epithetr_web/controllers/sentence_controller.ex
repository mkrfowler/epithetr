defmodule EpithetrWeb.SentenceController do
  use EpithetrWeb, :controller

  alias Epithetr.Word
  alias Epithetr.Word.Sentence

  def index(conn, _params) do
    sentences = Word.list_sentences()
    render(conn, "index.html", sentences: sentences)
  end

  def new(conn, _params) do
    changeset = Word.change_sentence(%Sentence{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sentence" => sentence_params}) do
    case Word.create_sentence(sentence_params) do
      {:ok, sentence} ->
        conn
        |> put_flash(:info, "Sentence created successfully.")
        |> redirect(to: sentence_path(conn, :show, sentence))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sentence = Word.get_sentence!(id)
    render(conn, "show.html", sentence: sentence)
  end

  def edit(conn, %{"id" => id}) do
    sentence = Word.get_sentence!(id)
    changeset = Word.change_sentence(sentence)
    render(conn, "edit.html", sentence: sentence, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sentence" => sentence_params}) do
    sentence = Word.get_sentence!(id)

    case Word.update_sentence(sentence, sentence_params) do
      {:ok, sentence} ->
        conn
        |> put_flash(:info, "Sentence updated successfully.")
        |> redirect(to: sentence_path(conn, :show, sentence))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sentence: sentence, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sentence = Word.get_sentence!(id)
    {:ok, _sentence} = Word.delete_sentence(sentence)

    conn
    |> put_flash(:info, "Sentence deleted successfully.")
    |> redirect(to: sentence_path(conn, :index))
  end
end
