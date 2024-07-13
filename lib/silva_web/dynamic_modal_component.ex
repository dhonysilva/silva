defmodule SilvaWeb.DynamicModalComponent do
  use SilvaWeb, :live_component

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
      <div>
        <.header>Media
          <:subtitle>This is a <%= @media.media_type %> from your database.</:subtitle>
          <:actions>
            <%= case @type do %>
              <% :video -> %>
                <.icon name="hero-video-camera-solid" class="w-6 h-6" />
              <% :picture -> %>
                <.icon name="hero-photo-solid" class="w-6 h-6" />
              <% :text -> %>
                <.icon name="hero-document-text-solid" class="w-6 h-6" />
            <% end %>
          </:actions>
        </.header>

        <.list>
          <:item title="Name"><%= @media.name %></:item>
          <:item title="Description"><%= @media.description %></:item>
          <:item title="Content">
            <%= case @type do %>
              <% :video -> %>
                <.video_player
                  video={@media.content}
                />
              <% :picture -> %>
                <.picture_embedded
                  picture={@media.content}
                />
              <% :text -> %>
                <%= @media.content %>
            <% end %>
          </:item>
          <:item title="Media type"><%= @media.media_type %></:item>
        </.list>

        <.back navigate={~p"/medias"}>Back to Medias</.back>
      </div>
    """
  end
end
