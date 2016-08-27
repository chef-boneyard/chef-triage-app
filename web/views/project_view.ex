defmodule Triage.ProjectView do
  use Triage.Web, :view

  def state(project) do
    case project.states do
      [ state | _tail ] -> state
      _ -> 0
    end
  end

  def issue_url(project, triaged \\ false) do
    triage = if triaged do
      "+no%3Amilestone"
    else
      ""
    end
    "https://github.com/#{project.organization}/#{project.name}/issues?q=is%3Aopen+is%3Aissue+sort%3Aupdated-asc#{triage}"
  end
  
  def pr_url(project) do
    "https://github.com/#{project.organization}/#{project.name}/pulls?q=is%3Aopen+is%3Apr+sort%3Aupdated-asc"
  end
  
end
