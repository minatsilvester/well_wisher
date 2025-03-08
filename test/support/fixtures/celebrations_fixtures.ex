defmodule WellWisher.CelebrationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WellWisher.Celebrations` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        desciption: "some desciption",
        name: "some name"
      })
      |> WellWisher.Celebrations.create_event()

    event
  end
end
