defmodule EpithetrWeb.PageController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Words.Noun
  alias Epithetr.Words.Adjective
  alias Epithetr.Repo

  def index(conn, params) do
    # nouns = Words.filter_nouns()
    # adjectives = Words.filter_adjectives()

    adjective_page = Adjective
    |> Repo.paginate(%{page: params["adjective_page"]})

    noun_page = Noun
    |> Repo.paginate(%{page: params["noun_page"]})

    render(conn, "index.html",
      noun_page: noun_page,
      adjective_page: adjective_page
    )
  end
end
