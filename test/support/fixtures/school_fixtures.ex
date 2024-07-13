defmodule Silva.SchoolFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Silva.School` context.
  """

  @doc """
  Generate a subject.
  """
  def subject_fixture(attrs \\ %{}) do
    {:ok, subject} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Silva.School.create_subject()

    subject
  end
end
