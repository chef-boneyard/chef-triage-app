defmodule Triage.State do
  use Triage.Web, :model

  schema "states" do
    field :issues, :integer
    field :untriaged_issues, :integer
    field :pull_requests, :integer
    belongs_to :project, Triage.Project

    timestamps()
  end

  @required ~w(issues untriaged_issues pull_requests)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
