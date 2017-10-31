defmodule EpithetrWeb.AdjectiveController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Words.Adjective

  def index(conn, _params) do
    adjectives = Words.list_adjectives()
    render(conn, "index.html", adjectives: adjectives)
  end

  def new(conn, _params) do
    changeset = Words.change_adjective(%Adjective{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"adjective" => adjective_params}) do
    case Words.create_adjective(adjective_params) do
      {:ok, adjective} ->
        conn
        |> put_flash(:info, "Descriptor created successfully.")
        |> redirect(to: adjective_path(conn, :show, adjective))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    adjective = Words.get_adjective!(id)
    render(conn, "show.html", adjective: adjective)
  end

  def edit(conn, %{"id" => id}) do
    adjective = Words.get_adjective!(id)
    changeset = Words.change_adjective(adjective)
    render(conn, "edit.html", adjective: adjective, changeset: changeset)
  end

  def update(conn, %{"id" => id, "adjective" => adjective_params}) do
    adjective = Words.get_adjective!(id)

    case Words.update_adjective(adjective, adjective_params) do
      {:ok, adjective} ->
        conn
        |> put_flash(:info, "Descriptor updated successfully.")
        |> redirect(to: adjective_path(conn, :show, adjective))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", adjective: adjective, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    adjective = Words.get_adjective!(id)
    {:ok, _adjective} = Words.delete_adjective(adjective)

    conn
    |> put_flash(:info, "Descriptor deleted successfully.")
    |> redirect(to: adjective_path(conn, :index))
  end
end
