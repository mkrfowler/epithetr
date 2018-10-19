defmodule EpithetrWeb.DescriptorController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Words.Descriptor

  def index(conn, _params) do
    descriptors = Words.list_descriptors()
    render(conn, "index.html", descriptors: descriptors)
  end

  def new(conn, _params) do
    changeset = Words.change_descriptor(%Descriptor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"descriptor" => descriptor_params}) do
    case Words.create_descriptor(descriptor_params) do
      {:ok, descriptor} ->
        conn
        |> put_flash(:info, "Descriptor created successfully.")
        |> redirect(to: descriptor_path(conn, :show, descriptor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    descriptor = Words.get_descriptor!(id)
    render(conn, "show.html", descriptor: descriptor)
  end

  def edit(conn, %{"id" => id}) do
    descriptor = Words.get_descriptor!(id)
    changeset = Words.change_descriptor(descriptor)
    render(conn, "edit.html", descriptor: descriptor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "descriptor" => descriptor_params}) do
    descriptor = Words.get_descriptor!(id)

    case Words.update_descriptor(descriptor, descriptor_params) do
      {:ok, descriptor} ->
        conn
        |> put_flash(:info, "Descriptor updated successfully.")
        |> redirect(to: descriptor_path(conn, :show, descriptor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", descriptor: descriptor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    descriptor = Words.get_descriptor!(id)
    {:ok, _descriptor} = Words.delete_descriptor(descriptor)

    conn
    |> put_flash(:info, "Descriptor deleted successfully.")
    |> redirect(to: descriptor_path(conn, :index))
  end
end
