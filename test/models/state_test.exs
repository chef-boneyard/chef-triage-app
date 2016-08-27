defmodule Triage.StateTest do
  use Triage.ModelCase

  alias Triage.State

  @valid_attrs %{issues: 42, pull_requests: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = State.changeset(%State{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = State.changeset(%State{}, @invalid_attrs)
    refute changeset.valid?
  end
end
