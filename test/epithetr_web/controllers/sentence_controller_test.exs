defmodule EpithetrWeb.SentenceControllerTest do
  use EpithetrWeb.ConnCase

  alias Epithetr.Words

  @create_attrs %{body: "some body", wholesome: true}
  @update_attrs %{body: "some updated body", wholesome: false}
  @invalid_attrs %{body: nil, wholesome: nil}

  def fixture(:sentence) do
    {:ok, sentence} = Words.create_sentence(@create_attrs)
    sentence
  end

  describe "index" do
    test "lists all sentences", %{conn: conn} do
      conn = get conn, sentence_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Sentences"
    end
  end

  describe "new sentence" do
    test "renders form", %{conn: conn} do
      conn = get conn, sentence_path(conn, :new)
      assert html_response(conn, 200) =~ "New Sentence"
    end
  end

  describe "create sentence" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, sentence_path(conn, :create), sentence: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == sentence_path(conn, :show, id)

      conn = get conn, sentence_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Sentence"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sentence_path(conn, :create), sentence: @invalid_attrs
      assert html_response(conn, 200) =~ "New Sentence"
    end
  end

  describe "edit sentence" do
    setup [:create_sentence]

    test "renders form for editing chosen sentence", %{conn: conn, sentence: sentence} do
      conn = get conn, sentence_path(conn, :edit, sentence)
      assert html_response(conn, 200) =~ "Edit Sentence"
    end
  end

  describe "update sentence" do
    setup [:create_sentence]

    test "redirects when data is valid", %{conn: conn, sentence: sentence} do
      conn = put conn, sentence_path(conn, :update, sentence), sentence: @update_attrs
      assert redirected_to(conn) == sentence_path(conn, :show, sentence)

      conn = get conn, sentence_path(conn, :show, sentence)
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, sentence: sentence} do
      conn = put conn, sentence_path(conn, :update, sentence), sentence: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Sentence"
    end
  end

  describe "delete sentence" do
    setup [:create_sentence]

    test "deletes chosen sentence", %{conn: conn, sentence: sentence} do
      conn = delete conn, sentence_path(conn, :delete, sentence)
      assert redirected_to(conn) == sentence_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, sentence_path(conn, :show, sentence)
      end
    end
  end

  defp create_sentence(_) do
    sentence = fixture(:sentence)
    {:ok, sentence: sentence}
  end
end
