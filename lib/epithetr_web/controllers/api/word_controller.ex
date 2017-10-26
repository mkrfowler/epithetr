defmodule EpithetrWeb.Api.WordController do
  use EpithetrWeb, :controller

  alias Epithetr.Words

  def index(conn, _params) do
    adjectives = Words.list_adjectives()
    nouns = Words.list_nouns()

    render conn, "index.json", adjectives: adjectives, nouns: nouns
  end
end
