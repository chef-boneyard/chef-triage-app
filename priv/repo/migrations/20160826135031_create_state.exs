defmodule Triage.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :issues, :integer
      add :untriaged_issues, :integer
      add :pull_requests, :integer
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:states, [:project_id])

  end
end
