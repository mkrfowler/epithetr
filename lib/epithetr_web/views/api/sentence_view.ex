defmodule EpithetrWeb.Api.SentenceView do
  use EpithetrWeb, :view

  def render("index.json", %{sentence: sentence}) do
    %{
      sentence: sentence
    }
  end
end