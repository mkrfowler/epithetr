defmodule EpithetrWeb.PageController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Words.Noun
  alias Epithetr.Words.Adjective

  def index(conn, _params) do
    nouns = Words.list_nouns()
    adjectives = Words.list_adjectives()
    render(conn, "index.html", nouns: nouns, adjectives: adjectives)
  end
end
