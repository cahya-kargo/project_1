defmodule Project1.TransporterVehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project1.TransporterVehicles` context.
  """

  @doc """
  Generate a transporter_vehicle.
  """
  def transporter_vehicle_fixture(attrs \\ %{}) do
    {:ok, transporter_vehicle} =
      attrs
      |> Enum.into(%{
        transporter_id: "some transporter_id",
        vehicle_id: 42
      })
      |> Project1.TransporterVehicles.create_transporter_vehicle()

    transporter_vehicle
  end
end
