defmodule Project1.TransporterVehicles.TransporterVehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transporter_vehicles" do
    # field :transporter_id, :integer
    # field :vehicle_id, :integer

    belongs_to :vehicle, Project1.Vehicles.Vehicle
    belongs_to :transporter, Project1.Transporters.Transporter
    timestamps()
  end

  @doc false
  def changeset(transporter_vehicle, attrs) do
    transporter_vehicle
    |> cast(attrs, [:transporter_id, :vehicle_id])
    |> validate_required([:transporter_id, :vehicle_id])
  end
end
