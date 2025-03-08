defmodule WellWisher.CelebrationsTest do
  use WellWisher.DataCase

  alias WellWisher.Celebrations

  describe "events" do
    alias WellWisher.Celebrations.Event

    import WellWisher.CelebrationsFixtures

    @invalid_attrs %{name: nil, desciption: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Celebrations.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Celebrations.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{name: "some name", desciption: "some desciption"}

      assert {:ok, %Event{} = event} = Celebrations.create_event(valid_attrs)
      assert event.name == "some name"
      assert event.desciption == "some desciption"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Celebrations.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{name: "some updated name", desciption: "some updated desciption"}

      assert {:ok, %Event{} = event} = Celebrations.update_event(event, update_attrs)
      assert event.name == "some updated name"
      assert event.desciption == "some updated desciption"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Celebrations.update_event(event, @invalid_attrs)
      assert event == Celebrations.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Celebrations.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Celebrations.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Celebrations.change_event(event)
    end
  end
end
