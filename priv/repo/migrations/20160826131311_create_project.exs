defmodule Triage.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :organization, :string
      add :triaged_at, :datetime

      timestamps()
    end

  end
end
