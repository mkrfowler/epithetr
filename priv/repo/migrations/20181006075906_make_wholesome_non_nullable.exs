defmodule Epithetr.Repo.Migrations.MakeWholesomeNonNullable do
  use Ecto.Migration

  def change do
    alter table("adjectives") do
      modify :wholesome, :boolean, null: false
    end

    alter table("nouns") do
      modify :wholesome, :boolean, null: false
    end
  end
end
