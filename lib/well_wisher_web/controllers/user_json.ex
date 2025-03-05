defmodule WellWisherWeb.UsersJSON do

  def show(%{user: user}) do
    %{
      data: %{
        name: user.name,
        email: user.email,
        time_zone: user.time_zone,
      }
    }
  end
end
