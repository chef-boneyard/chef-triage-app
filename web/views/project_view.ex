defmodule Triage.ProjectView do
  use Triage.Web, :view

  def state(project) do
    case project.states do
      [ state | _tail ] -> state
      _ -> 0
    end
  end

end
