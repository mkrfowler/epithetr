defmodule Epithetr.Words.Noun do
  use Ecto.Schema
  import Ecto.Changeset
  alias Epithetr.Words.Noun


  schema "nouns" do
    field :word, :string
    field :wholesome, :boolean

    timestamps()
  end

  @doc false
  def changeset(%Noun{} = noun, attrs) do
    noun
    |> cast(attrs, [:word, :wholesome])
    |> validate_required([:word])
  end
end
