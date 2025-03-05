defmodule WellWisher.Repo do
  use Ecto.Repo,
    otp_app: :well_wisher,
    adapter: Ecto.Adapters.Postgres
end
