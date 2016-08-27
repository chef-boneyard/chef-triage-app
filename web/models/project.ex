defmodule Triage.Project do
  use Triage.Web, :model

  schema "projects" do
    field :name, :string
    field :organization, :string
    field :triaged_at, Ecto.DateTime

    has_many :states, Triage.State
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :organization, :triaged_at])
    |> validate_required([:name, :organization])
  end

  def open_issues(prj, client) do
    Tentacat.Issues.list(prj.organization, prj.name, client)
  end

  def not_prs(issues) do
    Enum.filter(issues, fn(x) -> Map.get(x, "pull_request") == nil end )
  end

  def pull_requests(issues) do
    Enum.filter(issues, fn(x) -> Map.get(x, "pull_request") != nil end )
  end

  def untriaged(issues) do
    Enum.filter(issues, fn(x) -> Map.get(x, "milestone") == nil end )
  end

end
