defmodule Project1Web.TransporterController do
  use Project1Web, :controller

  alias Project1.Transporters
  alias Project1.Transporters.Transporter

  action_fallback Project1Web.FallbackController

  def index(conn, _params) do
    transporters = Transporters.list_transporter()
    render(conn, "index.json", transporters: transporters)
  end

  def create(conn, transporter_params) do
    with {:ok, %Transporter{} = transporter} <- Transporters.create_transporter(transporter_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transporter_path(conn, :show, transporter))
      |> render("show.json", transporter: transporter)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter = Transporters.get_transporter!(id)
    render(conn, "show.json", transporter: transporter)
  end

  def update(conn, params) do
    transporter = Transporters.get_transporter!(params["id"])
    with {:ok, %Transporter{} = transporter} <- Transporters.update_transporter(transporter, params) do
      render(conn, "show.json", transporter: transporter)
    end
  end

  def update_status(conn, params) do
    transporter = Transporters.get_transporter!(params["id"])
    with {:ok, %Transporter{} = transporter} <- Transporters.update_transporter(transporter, %{"status"=> params["status"]}) do
      render(conn, "show.json", transporter: transporter)
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter = Transporters.get_transporter!(id)

    with {:ok, %Transporter{}} <- Transporters.delete_transporter(transporter) do
      send_resp(conn, :no_content, "")
    end
  end
end
