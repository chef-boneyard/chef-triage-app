defmodule Mix.Tasks.Triage.Update do
  use Mix.Task
  alias Triage.Project

  @shortdoc "Update pull request and issue counts"

  def run(_args) do
    Mix.Task.run "app.start"
    Mix.shell.info "Updating counts"
    client_key = System.get_env("GITHUB_API_KEY")
    client = Tentacat.Client.new(%{access_token: client_key})

    for project <- Triage.Repo.all(Project) do
      # Mix.shell.info "Getting count for #{project.organization}/#{project.name}"
      all = Project.open_issues(project, client)
      pulls = all |> Project.pull_requests |> length
      issues = all |> Project.not_prs |> length
      untriaged = all |> Project.not_prs |> Project.untriaged |> length
      # Mix.shell.info "Count is #{pulls} Pull Requests and #{issues} Issues"
      Triage.Repo.insert!(Ecto.build_assoc(project, :states, %{issues: issues, untriaged_issues: untriaged, pull_requests: pulls}))
    end
  end
end
