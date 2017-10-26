defmodule Epithetr.Repo.Migrations.CreateAdjectives do
  use Ecto.Migration

  def change do
    create table(:adjectives) do
      add :word, :string

      timestamps()
    end

  end
end
