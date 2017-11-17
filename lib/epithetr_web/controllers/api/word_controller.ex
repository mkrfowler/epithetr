defmodule EpithetrWeb.Api.WordController do
  use EpithetrWeb, :controller

  alias Epithetr.Words

  def index(conn, params) do
    adjectives = Words.random_adjectives(params["adjectives"] || 1, true)
    nouns = Words.random_nouns(params["nouns"] || 1, true)

    render conn, "index.json", adjectives: adjectives, nouns: nouns
  end

  def unwholesome_index(conn, params) do
    adjectives = Words.random_adjectives(params["adjectives"] || 1)
    nouns = Words.random_nouns(params["nouns"] || 1)

    render conn, "index.json", adjectives: adjectives, nouns: nouns
  end
end
