defmodule CaseFormBugWeb.NewPersonLive do
  use Phoenix.LiveView
  alias CaseFormBug.Example.Person

  def render(assigns) do
    Phoenix.View.render(CaseFormBugWeb.PersonView, "new.html", assigns)
  end

  def mount(%{} = _params, socket) do
    {:ok,
     assign(socket, show_color: true, changeset: CaseFormBug.Example.change_person(%Person{}))}
  end

  def handle_event("toggle", _params, socket) do
    {:noreply, update(socket, :show_color, fn i -> !i end)}
  end

  def handle_event("validate", %{"person" => params}, socket) do
    changeset =
      %Person{}
      |> CaseFormBug.Example.change_person(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"person" => person_params}, socket) do
    case CaseFormBug.Example.create_person(person_params) do
      {:ok, person} ->
        {:stop,
         socket
         |> put_flash(:info, "person created")
         |> redirect(
           to: Routes.person_path(CaseFormBugWeb.Endpoint, CaseFormBug.Example.ShowView, person)
         )}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
