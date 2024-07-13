defmodule SilvaWeb.MediaLiveTest do
  use SilvaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Silva.MediasFixtures

  @create_attrs %{name: "some name", description: "some description", content: "some content", media_type: :text}
  @update_attrs %{name: "some updated name", description: "some updated description", content: "some updated content", media_type: :video}
  @invalid_attrs %{name: nil, description: nil, content: nil, media_type: nil}

  defp create_media(_) do
    media = media_fixture()
    %{media: media}
  end

  describe "Index" do
    setup [:create_media]

    test "lists all medias", %{conn: conn, media: media} do
      {:ok, _index_live, html} = live(conn, ~p"/medias")

      assert html =~ "Listing Medias"
      assert html =~ media.name
    end

    test "saves new media", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/medias")

      assert index_live |> element("a", "New Media") |> render_click() =~
               "New Media"

      assert_patch(index_live, ~p"/medias/new")

      assert index_live
             |> form("#media-form", media: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#media-form", media: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/medias")

      html = render(index_live)
      assert html =~ "Media created successfully"
      assert html =~ "some name"
    end

    test "updates media in listing", %{conn: conn, media: media} do
      {:ok, index_live, _html} = live(conn, ~p"/medias")

      assert index_live |> element("#medias-#{media.id} a", "Edit") |> render_click() =~
               "Edit Media"

      assert_patch(index_live, ~p"/medias/#{media}/edit")

      assert index_live
             |> form("#media-form", media: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#media-form", media: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/medias")

      html = render(index_live)
      assert html =~ "Media updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes media in listing", %{conn: conn, media: media} do
      {:ok, index_live, _html} = live(conn, ~p"/medias")

      assert index_live |> element("#medias-#{media.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#medias-#{media.id}")
    end
  end

  describe "Show" do
    setup [:create_media]

    test "displays media", %{conn: conn, media: media} do
      {:ok, _show_live, html} = live(conn, ~p"/medias/#{media}")

      assert html =~ "Show Media"
      assert html =~ media.name
    end

    test "updates media within modal", %{conn: conn, media: media} do
      {:ok, show_live, _html} = live(conn, ~p"/medias/#{media}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Media"

      assert_patch(show_live, ~p"/medias/#{media}/show/edit")

      assert show_live
             |> form("#media-form", media: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#media-form", media: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/medias/#{media}")

      html = render(show_live)
      assert html =~ "Media updated successfully"
      assert html =~ "some updated name"
    end
  end
end
