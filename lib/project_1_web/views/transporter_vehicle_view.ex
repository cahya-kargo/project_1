defmodule Project1Web.TransporterVehicleView do
  use Project1Web, :view
  alias Project1Web.TransporterVehicleView

  def render("index.json", %{transporter_vehicle: transporter_vehicle}) do
    %{data: render_many(transporter_vehicle, TransporterVehicleView, "transporter_vehicle.json")}
  end

  def render("show.json", %{transporter_vehicle: transporter_vehicle}) do
    %{data: render_one(transporter_vehicle, TransporterVehicleView, "transporter_vehicle.json")}
  end

  def render("transporter_vehicle.json", %{transporter_vehicle: transporter_vehicle}) do
    %{
      id: transporter_vehicle.id,
      vehicle: transporter_vehicle.vehicle,
      transporter: transporter_vehicle.transporter
    }
  end
end
