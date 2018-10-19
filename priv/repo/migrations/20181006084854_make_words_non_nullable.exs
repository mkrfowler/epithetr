defmodule Epithetr.Repo.Migrations.MakeWordsNonNullable do
  use Ecto.Migration

  def change do
    alter table("descriptors") do
      modify :word, :string, null: false
    end

    alter table("nouns") do
      modify :word, :string, null: false
    end
  end
end
