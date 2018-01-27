defmodule EpithetrWeb.SentenceController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Words.Sentence

  def index(conn, _params) do
    sentences = Words.list_sentences()
    render(conn, "index.html", sentences: sentences)
  end

  def new(conn, _params) do
    changeset = Words.change_sentence(%Sentence{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sentence" => sentence_params}) do
    case Words.create_sentence(sentence_params) do
      {:ok, sentence} ->
        conn
        |> put_flash(:info, "Sentence created successfully.")
        |> redirect(to: sentence_path(conn, :show, sentence))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sentence = Words.get_sentence!(id)
    render(conn, "show.html", sentence: sentence)
  end

  def edit(conn, %{"id" => id}) do
    sentence = Words.get_sentence!(id)
    changeset = Words.change_sentence(sentence)
    render(conn, "edit.html", sentence: sentence, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sentence" => sentence_params}) do
    sentence = Words.get_sentence!(id)

    case Words.update_sentence(sentence, sentence_params) do
      {:ok, sentence} ->
        conn
        |> put_flash(:info, "Sentence updated successfully.")
        |> redirect(to: sentence_path(conn, :show, sentence))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sentence: sentence, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sentence = Words.get_sentence!(id)
    {:ok, _sentence} = Words.delete_sentence(sentence)

    conn
    |> put_flash(:info, "Sentence deleted successfully.")
    |> redirect(to: sentence_path(conn, :index))
  end
end
