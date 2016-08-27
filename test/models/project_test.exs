defmodule Triage.ProjectTest do
  use Triage.ModelCase

  alias Triage.Project

  @valid_attrs %{last_triage: "some content", name: "some content", organization: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
