defmodule EpithetrWeb.AdjectiveControllerTest do
  use EpithetrWeb.ConnCase

  alias Epithetr.Words

  @create_attrs %{word: "some word"}
  @update_attrs %{word: "some updated word"}
  @invalid_attrs %{word: nil}

  def fixture(:adjective) do
    {:ok, adjective} = Words.create_adjective(@create_attrs)
    adjective
  end

  describe "index" do
    test "lists all adjectives", %{conn: conn} do
      conn = get conn, adjective_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Adjectives"
    end
  end

  describe "new adjective" do
    test "renders form", %{conn: conn} do
      conn = get conn, adjective_path(conn, :new)
      assert html_response(conn, 200) =~ "New Adjective"
    end
  end

  describe "create adjective" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, adjective_path(conn, :create), adjective: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == adjective_path(conn, :show, id)

      conn = get conn, adjective_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Adjective"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, adjective_path(conn, :create), adjective: @invalid_attrs
      assert html_response(conn, 200) =~ "New Adjective"
    end
  end

  describe "edit adjective" do
    setup [:create_adjective]

    test "renders form for editing chosen adjective", %{conn: conn, adjective: adjective} do
      conn = get conn, adjective_path(conn, :edit, adjective)
      assert html_response(conn, 200) =~ "Edit Adjective"
    end
  end

  describe "update adjective" do
    setup [:create_adjective]

    test "redirects when data is valid", %{conn: conn, adjective: adjective} do
      conn = put conn, adjective_path(conn, :update, adjective), adjective: @update_attrs
      assert redirected_to(conn) == adjective_path(conn, :show, adjective)

      conn = get conn, adjective_path(conn, :show, adjective)
      assert html_response(conn, 200) =~ "some updated word"
    end

    test "renders errors when data is invalid", %{conn: conn, adjective: adjective} do
      conn = put conn, adjective_path(conn, :update, adjective), adjective: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Adjective"
    end
  end

  describe "delete adjective" do
    setup [:create_adjective]

    test "deletes chosen adjective", %{conn: conn, adjective: adjective} do
      conn = delete conn, adjective_path(conn, :delete, adjective)
      assert redirected_to(conn) == adjective_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, adjective_path(conn, :show, adjective)
      end
    end
  end

  defp create_adjective(_) do
    adjective = fixture(:adjective)
    {:ok, adjective: adjective}
  end
end
