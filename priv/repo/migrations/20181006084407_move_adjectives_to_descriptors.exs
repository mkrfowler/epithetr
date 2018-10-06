defmodule Epithetr.Repo.Migrations.MoveAdjectivesToDescriptors do
  use Ecto.Migration

  def change do
    rename table("adjectives"), to: table("descriptors")
    rename table("adjectives_id_seq"), to: table("descriptors_id_seq")
  end
end
