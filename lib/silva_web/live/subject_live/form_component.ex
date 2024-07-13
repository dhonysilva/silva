defmodule SilvaWeb.SubjectLive.FormComponent do
  use SilvaWeb, :live_component

  alias Silva.School

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage subject records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="subject-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Subject</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{subject: subject} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(School.change_subject(subject))
     end)}
  end

  @impl true
  def handle_event("validate", %{"subject" => subject_params}, socket) do
    changeset = School.change_subject(socket.assigns.subject, subject_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"subject" => subject_params}, socket) do
    save_subject(socket, socket.assigns.action, subject_params)
  end

  defp save_subject(socket, :edit, subject_params) do
    case School.update_subject(socket.assigns.subject, subject_params) do
      {:ok, subject} ->
        notify_parent({:saved, subject})

        {:noreply,
         socket
         |> put_flash(:info, "Subject updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_subject(socket, :new, subject_params) do
    case School.create_subject(subject_params) do
      {:ok, subject} ->
        notify_parent({:saved, subject})

        {:noreply,
         socket
         |> put_flash(:info, "Subject created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
