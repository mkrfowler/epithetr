defmodule EpithetrWeb.PageController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Repo

  def index(conn, params) do
    wholesome = params["wholesome"] || "true"
    |> String.to_existing_atom()

    descriptor_page = Words.filter_descriptors(wholesome)
    |> Repo.paginate(%{page: params["descriptor_page"]})

    noun_page = Words.filter_nouns(wholesome)
    |> Repo.paginate(%{page: params["noun_page"]})

    render(conn, "index.html",
      noun_page: noun_page,
      descriptor_page: descriptor_page,
      wholesome: wholesome
    )
  end
end
