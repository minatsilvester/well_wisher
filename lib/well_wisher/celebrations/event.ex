defmodule WellWisher.Celebrations.Event do
  use Ecto.Schema
  import Ecto.Changeset

  alias WellWisher.Accounts.User

  @required_attributes [
    :name,
    :description,
    :for_user_email_id,
    :created_by_user_id
  ]

  schema "events" do
    field :name, :string
    field :description, :string
    field :for_user_email_id, :string

    belongs_to :created_by_user, User, foreign_key: :created_by_user_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, @required_attributes)
    |> validate_required(@required_attributes)
  end
end
