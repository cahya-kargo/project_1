defmodule Project1Web.TransporterVehicleController do
  use Project1Web, :controller

  alias Project1.TransporterVehicles
  alias Project1.TransporterVehicles.TransporterVehicle

  action_fallback Project1Web.FallbackController

  def index(conn, _params) do
    transporter_vehicle = TransporterVehicles.list_transporter_vehicle()
    render(conn, "index.json", transporter_vehicle: transporter_vehicle)
  end

  def create(conn, transporter_vehicle_params) do
    with {:ok, %TransporterVehicle{} = transporter_vehicle} <- TransporterVehicles.create_transporter_vehicle(transporter_vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transporter_vehicle_path(conn, :show, transporter_vehicle))
      |> render("show.json", transporter_vehicle: transporter_vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter_vehicle = TransporterVehicles.get_transporter_vehicle!(id)
    render(conn, "show.json", transporter_vehicle: transporter_vehicle)
  end

  def update(conn, %{"id" => id, "transporter_vehicle" => transporter_vehicle_params}) do
    transporter_vehicle = TransporterVehicles.get_transporter_vehicle!(id)

    with {:ok, %TransporterVehicle{} = transporter_vehicle} <- TransporterVehicles.update_transporter_vehicle(transporter_vehicle, transporter_vehicle_params) do
      render(conn, "show.json", transporter_vehicle: transporter_vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter_vehicle = TransporterVehicles.get_transporter_vehicle!(id)

    with {:ok, %TransporterVehicle{}} <- TransporterVehicles.delete_transporter_vehicle(transporter_vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
