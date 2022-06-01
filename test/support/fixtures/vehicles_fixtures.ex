defmodule Project1.VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project1.Vehicles` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        status: true,
        vehicle_plate: "some vehicle_plate"
      })
      |> Project1.Vehicles.create_vehicle()

    vehicle
  end
end
