defmodule WellWisherWeb.UsersController do
  use WellWisherWeb, :controller

  alias WellWisher.Accounts
  alias WellWisher.Accounts.User

  action_fallback WellWisherWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params) do
      IO.inspect(user)
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/focus_sessions/")
      |> render(:show, user: user)
    end
  end

end
