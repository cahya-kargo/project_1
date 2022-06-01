defmodule Project1.Repo.Migrations.AddUniqueIndexTransporterIdVehicle do
  use Ecto.Migration

  def change do
    create index("vehicles",[:vehicle_plate], unique: true)
    alter table("vehicles") do
        add :transporter_id, references("transporters")
    end
  end
end
