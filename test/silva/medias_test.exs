defmodule Silva.MediasTest do
  use Silva.DataCase

  alias Silva.Medias

  describe "medias" do
    alias Silva.Medias.Media

    import Silva.MediasFixtures

    @invalid_attrs %{name: nil, description: nil, content: nil, media_type: nil}

    test "list_medias/0 returns all medias" do
      media = media_fixture()
      assert Medias.list_medias() == [media]
    end

    test "get_media!/1 returns the media with given id" do
      media = media_fixture()
      assert Medias.get_media!(media.id) == media
    end

    test "create_media/1 with valid data creates a media" do
      valid_attrs = %{name: "some name", description: "some description", content: "some content", media_type: :text}

      assert {:ok, %Media{} = media} = Medias.create_media(valid_attrs)
      assert media.name == "some name"
      assert media.description == "some description"
      assert media.content == "some content"
      assert media.media_type == :text
    end

    test "create_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_media(@invalid_attrs)
    end

    test "update_media/2 with valid data updates the media" do
      media = media_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", content: "some updated content", media_type: :video}

      assert {:ok, %Media{} = media} = Medias.update_media(media, update_attrs)
      assert media.name == "some updated name"
      assert media.description == "some updated description"
      assert media.content == "some updated content"
      assert media.media_type == :video
    end

    test "update_media/2 with invalid data returns error changeset" do
      media = media_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_media(media, @invalid_attrs)
      assert media == Medias.get_media!(media.id)
    end

    test "delete_media/1 deletes the media" do
      media = media_fixture()
      assert {:ok, %Media{}} = Medias.delete_media(media)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_media!(media.id) end
    end

    test "change_media/1 returns a media changeset" do
      media = media_fixture()
      assert %Ecto.Changeset{} = Medias.change_media(media)
    end
  end
end
