defmodule Project1Web.VehicleView do
  use Project1Web, :view
  alias Project1Web.VehicleView

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.id,
      vehicle_plate: vehicle.vehicle_plate,
      status: vehicle.status,
      transporter_id: vehicle.transporter_id
    }
  end
end
