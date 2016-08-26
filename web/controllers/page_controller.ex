defmodule Triage.PageController do
  use Triage.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
