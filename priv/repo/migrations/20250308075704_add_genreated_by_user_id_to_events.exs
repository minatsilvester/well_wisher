defmodule WellWisher.Repo.Migrations.AddGenreatedByUserIdToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :created_by_user_id, references(:users, on_delete: :nothing)
      add :for_user_email_id, :string, null: false
    end

    create index(:events, [:created_by_user_id])
  end
end
