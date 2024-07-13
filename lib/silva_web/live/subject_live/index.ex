defmodule SilvaWeb.SubjectLive.Index do
  use SilvaWeb, :live_view

  alias Silva.School
  alias Silva.School.Subject

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :subjects, School.list_subjects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Subject")
    |> assign(:subject, School.get_subject!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Subject")
    |> assign(:subject, %Subject{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Subjects")
    |> assign(:subject, nil)
  end

  @impl true
  def handle_info({SilvaWeb.SubjectLive.FormComponent, {:saved, subject}}, socket) do
    {:noreply, stream_insert(socket, :subjects, subject)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    subject = School.get_subject!(id)
    {:ok, _} = School.delete_subject(subject)

    {:noreply, stream_delete(socket, :subjects, subject)}
  end
end
