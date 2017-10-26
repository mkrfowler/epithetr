defmodule EpithetrWeb.NounController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Words.Noun

  def index(conn, _params) do
    nouns = Words.list_nouns()
    render(conn, "index.html", nouns: nouns)
  end

  def new(conn, _params) do
    changeset = Words.change_noun(%Noun{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"noun" => noun_params}) do
    case Words.create_noun(noun_params) do
      {:ok, noun} ->
        conn
        |> put_flash(:info, "Noun created successfully.")
        |> redirect(to: noun_path(conn, :show, noun))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    noun = Words.get_noun!(id)
    render(conn, "show.html", noun: noun)
  end

  def edit(conn, %{"id" => id}) do
    noun = Words.get_noun!(id)
    changeset = Words.change_noun(noun)
    render(conn, "edit.html", noun: noun, changeset: changeset)
  end

  def update(conn, %{"id" => id, "noun" => noun_params}) do
    noun = Words.get_noun!(id)

    case Words.update_noun(noun, noun_params) do
      {:ok, noun} ->
        conn
        |> put_flash(:info, "Noun updated successfully.")
        |> redirect(to: noun_path(conn, :show, noun))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", noun: noun, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    noun = Words.get_noun!(id)
    {:ok, _noun} = Words.delete_noun(noun)

    conn
    |> put_flash(:info, "Noun deleted successfully.")
    |> redirect(to: noun_path(conn, :index))
  end
end
