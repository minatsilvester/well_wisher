defmodule WellWisher.Repo.Migrations.AddColumnsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :string, null: false
      add :time_zone, :string, null: false
    end
  end
end
