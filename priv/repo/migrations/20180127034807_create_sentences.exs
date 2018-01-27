defmodule Epithetr.Repo.Migrations.CreateSentences do
  use Ecto.Migration

  def change do
    create table(:sentences) do
      add :body, :string
      add :wholesome, :boolean, default: false, null: false

      timestamps()
    end

  end
end
