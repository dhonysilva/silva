defmodule Silva.MediasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Silva.Medias` context.
  """

  @doc """
  Generate a media.
  """
  def media_fixture(attrs \\ %{}) do
    {:ok, media} =
      attrs
      |> Enum.into(%{
        content: "some content",
        description: "some description",
        media_type: :text,
        name: "some name"
      })
      |> Silva.Medias.create_media()

    media
  end
end
