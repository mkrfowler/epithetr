defmodule Epithetr.Repo.Migrations.CreateNouns do
  use Ecto.Migration

  def change do
    create table(:nouns) do
      add :word, :string

      timestamps()
    end

  end
end
