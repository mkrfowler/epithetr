defmodule Epithetr.Words.Adjective do
  use Ecto.Schema
  import Ecto.Changeset
  alias Epithetr.Words.Adjective


  schema "adjectives" do
    field :word, :string

    timestamps()
  end

  @doc false
  def changeset(%Adjective{} = adjective, attrs) do
    adjective
    |> cast(attrs, [:word])
    |> validate_required([:word])
  end
end
