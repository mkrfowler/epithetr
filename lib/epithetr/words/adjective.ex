defmodule Epithetr.Words.Descriptor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Epithetr.Words.Descriptor


  schema "descriptors" do
    field :word, :string
    field :wholesome, :boolean

    timestamps()
  end

  @doc false
  def changeset(%Descriptor{} = descriptor, attrs) do
    descriptor
    |> cast(attrs, [:word, :wholesome])
    |> validate_required([:word, :wholesome])
  end
end
