defmodule EpithetrWeb.NounControllerTest do
  use EpithetrWeb.ConnCase

  alias Epithetr.Words

  @create_attrs %{word: "some word"}
  @update_attrs %{word: "some updated word"}
  @invalid_attrs %{word: nil}

  def fixture(:noun) do
    {:ok, noun} = Words.create_noun(@create_attrs)
    noun
  end

  describe "index" do
    test "lists all nouns", %{conn: conn} do
      conn = get conn, noun_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Nouns"
    end
  end

  describe "new noun" do
    test "renders form", %{conn: conn} do
      conn = get conn, noun_path(conn, :new)
      assert html_response(conn, 200) =~ "New Noun"
    end
  end

  describe "create noun" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, noun_path(conn, :create), noun: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == noun_path(conn, :show, id)

      conn = get conn, noun_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Noun"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, noun_path(conn, :create), noun: @invalid_attrs
      assert html_response(conn, 200) =~ "New Noun"
    end
  end

  describe "edit noun" do
    setup [:create_noun]

    test "renders form for editing chosen noun", %{conn: conn, noun: noun} do
      conn = get conn, noun_path(conn, :edit, noun)
      assert html_response(conn, 200) =~ "Edit Noun"
    end
  end

  describe "update noun" do
    setup [:create_noun]

    test "redirects when data is valid", %{conn: conn, noun: noun} do
      conn = put conn, noun_path(conn, :update, noun), noun: @update_attrs
      assert redirected_to(conn) == noun_path(conn, :show, noun)

      conn = get conn, noun_path(conn, :show, noun)
      assert html_response(conn, 200) =~ "some updated word"
    end

    test "renders errors when data is invalid", %{conn: conn, noun: noun} do
      conn = put conn, noun_path(conn, :update, noun), noun: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Noun"
    end
  end

  describe "delete noun" do
    setup [:create_noun]

    test "deletes chosen noun", %{conn: conn, noun: noun} do
      conn = delete conn, noun_path(conn, :delete, noun)
      assert redirected_to(conn) == noun_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, noun_path(conn, :show, noun)
      end
    end
  end

  defp create_noun(_) do
    noun = fixture(:noun)
    {:ok, noun: noun}
  end
end
