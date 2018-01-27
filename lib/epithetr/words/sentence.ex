defmodule Epithetr.Words.Sentence do
  use Ecto.Schema
  import Ecto.Changeset
  alias Epithetr.Words.Sentence


  schema "sentences" do
    field :body, :string
    field :wholesome, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%Sentence{} = sentence, attrs) do
    sentence
    |> cast(attrs, [:body, :wholesome])
    |> validate_required([:body, :wholesome])
  end
end
