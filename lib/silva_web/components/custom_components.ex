defmodule SilvaWeb.CustomComponents do
  use Phoenix.Component
  import Phoenix.Component
  import SilvaWeb.CoreComponents

  @doc """
  Renders a video embedded from YouTube.
  """
  attr :video, :any, required: true

  def video_player(assigns) do
    ~H"""
      <iframe width="100%" height="100%" position= "absolute" src={"https://www.youtube.com/embed/#{@video}"}></iframe>
    """
  end

  @doc """
  Renders a picture embedded from Flickr.
  """
  attr :picture, :any, required: true

  def picture_embedded(assigns) do
    ~H"""
      <a data-flickr-embed="true"><img src={@picture} width="100%" height="100%"/></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>
    """
  end

  @doc """
  Renders a Media preview card.
  """
  attr :link, :any, required: true

  def media_preview_card(assigns) do
    ~H"""
      <.link navigate={@link}
        class="group relative rounded-2xl px-6 py-4 text-sm leading-6 text-zinc-900 sm:py-6">
        <span class="absolute inset-0 rounded-2xl bg-zinc-50 transition group-hover:bg-zinc-100 sm:group-hover:scale-105">
        </span>
        <span class="relative flex items-left gap-4 sm:flex-col">
          <%= case @type do %>
            <% :video -> %>
              <.icon name="hero-video-camera" class="w-4 h-4" />
            <% :picture -> %>
              <.icon name="hero-photo" class="w-4 h-4" />
            <% :text -> %>
              <.icon name="hero-document-text" class="w-4 h-4" />
          <% end %>
          <%= @name %>
        </span>
      </.link>
    """
  end
end
