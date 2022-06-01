defmodule Project1.Repo.Migrations.CreateTransporterVehicle do
  use Ecto.Migration

  def change do
    create table(:transporter_vehicles) do
      add :transporter_id, references("transporters")
      add :vehicle_id, references("vehicles")

      timestamps()
    end
  end
end
