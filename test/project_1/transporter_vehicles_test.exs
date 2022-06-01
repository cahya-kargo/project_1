defmodule Project1.TransporterVehiclesTest do
  use Project1.DataCase

  alias Project1.TransporterVehicles

  describe "transporter_vehicle" do
    alias Project1.TransporterVehicles.TransporterVehicle

    import Project1.TransporterVehiclesFixtures

    @invalid_attrs %{transporter_id: nil, vehicle_id: nil}

    test "list_transporter_vehicle/0 returns all transporter_vehicle" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert TransporterVehicles.list_transporter_vehicle() == [transporter_vehicle]
    end

    test "get_transporter_vehicle!/1 returns the transporter_vehicle with given id" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert TransporterVehicles.get_transporter_vehicle!(transporter_vehicle.id) == transporter_vehicle
    end

    test "create_transporter_vehicle/1 with valid data creates a transporter_vehicle" do
      valid_attrs = %{transporter_id: "some transporter_id", vehicle_id: 42}

      assert {:ok, %TransporterVehicle{} = transporter_vehicle} = TransporterVehicles.create_transporter_vehicle(valid_attrs)
      assert transporter_vehicle.transporter_id == "some transporter_id"
      assert transporter_vehicle.vehicle_id == 42
    end

    test "create_transporter_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TransporterVehicles.create_transporter_vehicle(@invalid_attrs)
    end

    test "update_transporter_vehicle/2 with valid data updates the transporter_vehicle" do
      transporter_vehicle = transporter_vehicle_fixture()
      update_attrs = %{transporter_id: "some updated transporter_id", vehicle_id: 43}

      assert {:ok, %TransporterVehicle{} = transporter_vehicle} = TransporterVehicles.update_transporter_vehicle(transporter_vehicle, update_attrs)
      assert transporter_vehicle.transporter_id == "some updated transporter_id"
      assert transporter_vehicle.vehicle_id == 43
    end

    test "update_transporter_vehicle/2 with invalid data returns error changeset" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = TransporterVehicles.update_transporter_vehicle(transporter_vehicle, @invalid_attrs)
      assert transporter_vehicle == TransporterVehicles.get_transporter_vehicle!(transporter_vehicle.id)
    end

    test "delete_transporter_vehicle/1 deletes the transporter_vehicle" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert {:ok, %TransporterVehicle{}} = TransporterVehicles.delete_transporter_vehicle(transporter_vehicle)
      assert_raise Ecto.NoResultsError, fn -> TransporterVehicles.get_transporter_vehicle!(transporter_vehicle.id) end
    end

    test "change_transporter_vehicle/1 returns a transporter_vehicle changeset" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert %Ecto.Changeset{} = TransporterVehicles.change_transporter_vehicle(transporter_vehicle)
    end
  end
end
