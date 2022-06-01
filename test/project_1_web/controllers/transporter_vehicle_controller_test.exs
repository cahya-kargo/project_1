defmodule Project1Web.TransporterVehicleControllerTest do
  use Project1Web.ConnCase

  import Project1.TransporterVehiclesFixtures

  alias Project1.TransporterVehicles.TransporterVehicle

  @create_attrs %{
    transporter_id: "some transporter_id",
    vehicle_id: 42
  }
  @update_attrs %{
    transporter_id: "some updated transporter_id",
    vehicle_id: 43
  }
  @invalid_attrs %{transporter_id: nil, vehicle_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transporter_vehicle", %{conn: conn} do
      conn = get(conn, Routes.transporter_vehicle_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transporter_vehicle" do
    test "renders transporter_vehicle when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transporter_vehicle_path(conn, :create), transporter_vehicle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transporter_vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "transporter_id" => "some transporter_id",
               "vehicle_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transporter_vehicle_path(conn, :create), transporter_vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transporter_vehicle" do
    setup [:create_transporter_vehicle]

    test "renders transporter_vehicle when data is valid", %{conn: conn, transporter_vehicle: %TransporterVehicle{id: id} = transporter_vehicle} do
      conn = put(conn, Routes.transporter_vehicle_path(conn, :update, transporter_vehicle), transporter_vehicle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transporter_vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "transporter_id" => "some updated transporter_id",
               "vehicle_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transporter_vehicle: transporter_vehicle} do
      conn = put(conn, Routes.transporter_vehicle_path(conn, :update, transporter_vehicle), transporter_vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transporter_vehicle" do
    setup [:create_transporter_vehicle]

    test "deletes chosen transporter_vehicle", %{conn: conn, transporter_vehicle: transporter_vehicle} do
      conn = delete(conn, Routes.transporter_vehicle_path(conn, :delete, transporter_vehicle))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transporter_vehicle_path(conn, :show, transporter_vehicle))
      end
    end
  end

  defp create_transporter_vehicle(_) do
    transporter_vehicle = transporter_vehicle_fixture()
    %{transporter_vehicle: transporter_vehicle}
  end
end
