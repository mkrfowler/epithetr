defmodule Epithetr.Words.Adjective do
  use Ecto.Schema
  import Ecto.Changeset
  alias Epithetr.Words.Adjective


  schema "adjectives" do
    field :word, :string
    field :wholesome, :boolean

    timestamps()
  end

  @doc false
  def changeset(%Adjective{} = adjective, attrs) do
    adjective
    |> cast(attrs, [:word, :wholesome])
    |> validate_required([:word, :wholesome])
  end
end
