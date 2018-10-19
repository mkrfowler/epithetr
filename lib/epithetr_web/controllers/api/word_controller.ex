defmodule EpithetrWeb.Api.WordController do
  use EpithetrWeb, :controller

  alias Epithetr.Words

  def index(conn, params) do
    descriptors = Words.random_descriptors(params["adjectives"] || 1, true)
    nouns = Words.random_nouns(params["nouns"] || 1, true)

    render conn, "index.json", descriptors: descriptors, nouns: nouns
  end

  def unwholesome_index(conn, params) do
    descriptors = Words.random_descriptors(params["adjectives"] || 1)
    nouns = Words.random_nouns(params["nouns"] || 1)

    render conn, "index.json", descriptors: descriptors, nouns: nouns
  end
end
