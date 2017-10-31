defmodule Epithetr.Repo.Migrations.AddWholesomeness do
  use Ecto.Migration

  def change do
    alter table("adjectives") do
      add :wholesome, :boolean, default: false
    end

    alter table("nouns") do
      add :wholesome, :boolean, default: false
    end
  end
end
