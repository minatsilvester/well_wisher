defmodule WellWisherWeb.UserSessionJSON do

  def show(user) do
    %{
      data: %{
        id: user.id,
        token: user.token,
        name: user.name,
        email: user.email,
        time_zone: user.time_zone
      }
    }
  end
end
