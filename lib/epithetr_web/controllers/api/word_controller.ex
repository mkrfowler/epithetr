defmodule EpithetrWeb.Api.WordController do
  use EpithetrWeb, :controller

  alias Epithetr.Words

  def index(conn, _params) do
    adjectives = Words.random_adjectives(1)
    nouns = Words.random_nouns(1)

    render conn, "index.json", adjectives: adjectives, nouns: nouns
  end

  def unwholesome_index(conn, _params) do
    adjectives = Words.random_adjectives(1, false)
    nouns = Words.random_nouns(1, false)

    render conn, "index.json", adjectives: adjectives, nouns: nouns
  end
end
