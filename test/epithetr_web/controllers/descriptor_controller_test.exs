defmodule EpithetrWeb.DescriptorControllerTest do
  use EpithetrWeb.ConnCase

  alias Epithetr.Words

  @create_attrs %{word: "some word", wholesome: false}
  @update_attrs %{word: "some updated word"}
  @invalid_attrs %{word: nil}

  def fixture(:descriptor) do
    {:ok, descriptor} = Words.create_descriptor(@create_attrs)
    descriptor
  end

  describe "index" do
    test "lists all descriptors", %{conn: conn} do
      conn = get conn, descriptor_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Descriptors"
    end
  end

  describe "new descriptor" do
    test "renders form", %{conn: conn} do
      conn = get conn, descriptor_path(conn, :new)
      assert html_response(conn, 200) =~ "New Descriptor"
    end
  end

  describe "create descriptor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, descriptor_path(conn, :create), descriptor: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == descriptor_path(conn, :show, id)

      conn = get conn, descriptor_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Descriptor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, descriptor_path(conn, :create), descriptor: @invalid_attrs
      assert html_response(conn, 200) =~ "New Descriptor"
    end
  end

  describe "edit descriptor" do
    setup [:create_descriptor]

    test "renders form for editing chosen descriptor", %{conn: conn, descriptor: descriptor} do
      conn = get conn, descriptor_path(conn, :edit, descriptor)
      assert html_response(conn, 200) =~ "Edit Descriptor"
    end
  end

  describe "update descriptor" do
    setup [:create_descriptor]

    test "redirects when data is valid", %{conn: conn, descriptor: descriptor} do
      conn = put conn, descriptor_path(conn, :update, descriptor), descriptor: @update_attrs
      assert redirected_to(conn) == descriptor_path(conn, :show, descriptor)

      conn = get conn, descriptor_path(conn, :show, descriptor)
      assert html_response(conn, 200) =~ "some updated word"
    end

    test "renders errors when data is invalid", %{conn: conn, descriptor: descriptor} do
      conn = put conn, descriptor_path(conn, :update, descriptor), descriptor: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Descriptor"
    end
  end

  describe "delete descriptor" do
    setup [:create_descriptor]

    test "deletes chosen descriptor", %{conn: conn, descriptor: descriptor} do
      conn = delete conn, descriptor_path(conn, :delete, descriptor)
      assert redirected_to(conn) == descriptor_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, descriptor_path(conn, :show, descriptor)
      end
    end
  end

  defp create_descriptor(_) do
    descriptor = fixture(:descriptor)
    {:ok, descriptor: descriptor}
  end
end
