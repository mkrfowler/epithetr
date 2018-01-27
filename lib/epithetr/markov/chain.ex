defmodule Epithetr.Markov.Chain do
  def construct_sentence(model) do
    starting_keys = Enum.filter(Map.keys(model), fn(key) -> key != "." && map_size(model[key]) > 1 end)

    {start, _next} = Map.take(model, starting_keys)
    |> Enum.random

    sentence_with(model, start)
  end

  def sentence_with(model, start) do
    Stream.unfold(start, fn "." -> nil;  prev_word -> { prev_word, construct_part(model[prev_word])} end)
    |> Enum.to_list
    |> Enum.join(" ")
  end

  def construct_part(possibles) do
    keys = Enum.reverse(Map.keys(possibles))
    highest = hd(keys)

    next_rand = Enum.random(1..highest.last)
    next = Enum.find(keys, fn(range) -> Enum.member?(range, next_rand) end)

    possibles[next]
  end

  def construct_model(words) do
    words
    |> chunk_data
    |> construct_map
    |> populate_probabilities
  end

  def populate_probabilities(model) do
    Enum.into(model, %{}, &update_entry/1)
  end

  def update_entry({key, entries}) do
    probs = Enum.map(entries, fn({_key, entry}) -> entry[:occurences] end)
    |> Enum.sum
    |> define_probabilities(entries)

    { key, probs }
  end

  def define_probabilities(sum, entries) do
    Enum.reduce(entries, %{}, fn(entry, acc) -> define_probability(entry, acc, sum)  end)
  end

  def define_probability({key, values}, results, sum) do
    maximal = Enum.max(Enum.map(Map.keys(results), fn(range) -> range.last end) ++ [0])
    probability = maximal + trunc((1000 / sum) * values[:occurences]) # TODO - make this larger if we have bigger data?

    Map.put(results, (maximal..probability), key)
  end

  def chunk_data(words) do
    Enum.chunk(words, 2, 1)
  end

  def construct_map(word_chunks) do
    Enum.reduce(word_chunks, %{}, fn(chunk, map) -> update_model(chunk, map) end)
  end

  # {
  #   input => {
  #     result1 => { occurences: 1 },
  #     result2 => { occurences: 2 }, ...
  #   }, ...
  # }

  def update_model(chunk, map) do
    input = hd(chunk)
    result = hd(tl(chunk))

    initial_value = Map.put(%{}, result, %{ occurences: 1 })

    Map.update(map, input, initial_value, fn(value) -> update_input(result, value) end)
  end

  def update_input(result, all_results) do
    Map.update(all_results, result, %{ occurences: 1 }, &update_metadata/1)
  end

  def update_metadata(metadata) do
    %{ occurences: metadata[:occurences] + 1 }
  end
end