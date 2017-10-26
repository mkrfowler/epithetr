defmodule EpithetrWeb.Api.WordView do
  use EpithetrWeb, :view

  def render("index.json", %{adjectives: adjectives, nouns: nouns}) do
    %{
      adjectives: render_many(adjectives, EpithetrWeb.Api.WordView, "word.json"),
      nouns: render_many(nouns, EpithetrWeb.Api.WordView, "word.json"),
    }
  end

  def render("word.json", %{word: word}) do
    %{word: String.downcase(word.word)}
  end
end