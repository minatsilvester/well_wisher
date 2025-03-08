defmodule WellWisher.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
