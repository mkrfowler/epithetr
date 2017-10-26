defmodule EpithetrWeb.Api.WordView do
  use EpithetrWeb, :view

  def render("index.json", %{adjectives: adjectives}) do
    %{data: render_many(adjectives, EpithetrWeb.Api.WordView, "word.json")}
  end

  def render("word.json", %{word: word}) do
    %{word: word.word}
  end
end