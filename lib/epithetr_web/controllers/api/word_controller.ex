defmodule EpithetrWeb.Api.WordController do
  use EpithetrWeb, :controller

  alias Epithetr.Words

  def index(conn, _params) do
    adjectives = Words.list_adjectives()

    render conn, "index.json", adjectives: adjectives
  end
end
