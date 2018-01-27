defmodule EpithetrWeb.Api.SentenceController do
  use EpithetrWeb, :controller

  alias Epithetr.Words
  alias Epithetr.Markov.Chain

  def index(conn, _params) do
    sentence = Words.list_sentences
    |> Enum.flat_map(fn(sentence) -> String.split(sentence.body, " ") ++ ["."] end)
    |> Chain.construct_model
    |> Chain.construct_sentence

    render conn, "index.json", sentence: sentence
  end
end
