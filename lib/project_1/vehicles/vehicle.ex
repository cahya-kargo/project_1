defmodule Project1.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :status, Ecto.Enum, values: [:validated, :not_validated], default: :not_validated
    field :vehicle_plate, :string
    field :transporter_id, :integer

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:vehicle_plate, :status, :transporter_id])
    |> validate_required([:vehicle_plate, :status])
  end
end
