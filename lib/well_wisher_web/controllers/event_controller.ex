defmodule WellWisherWeb.EventController do
  use WellWisherWeb, :controller

  alias WellWisher.Celebrations
  alias WellWisher.Celebrations.Event

  action_fallback WellWisherWeb.FallbackController

  def index(conn, _params) do
    events = Celebrations.list_events()
    render(conn, :index, events: events)
  end

  def create(conn, %{"event" => event_params}) do
    with {:ok, %Event{} = event} <- Celebrations.create_event(event_params, conn.assigns.current_user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/v1/events/#{event}")
      |> render(:show, event: event)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Celebrations.get_event!(id)
    render(conn, :show, event: event)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Celebrations.get_event!(id)

    with {:ok, %Event{} = event} <- Celebrations.update_event(event, event_params) do
      render(conn, :show, event: event)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Celebrations.get_event!(id)

    with {:ok, %Event{}} <- Celebrations.delete_event(event) do
      send_resp(conn, :no_content, "")
    end
  end
end
