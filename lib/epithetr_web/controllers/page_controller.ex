defmodule EpithetrWeb.PageController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Repo

  def index(conn, params) do
    wholesome = params["wholesome"] || "true"
    |> String.to_existing_atom()

    adjective_page = Words.filter_adjectives(wholesome)
    |> Repo.paginate(%{page: params["adjective_page"]})

    noun_page = Words.filter_nouns(wholesome)
    |> Repo.paginate(%{page: params["noun_page"]})

    render(conn, "index.html",
      noun_page: noun_page,
      adjective_page: adjective_page,
      wholesome: wholesome
    )
  end
end
