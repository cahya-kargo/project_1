defmodule Project1.TransportersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project1.Transporters` context.
  """

  @doc """
  Generate a transporter.
  """
  def transporter_fixture(attrs \\ %{}) do
    {:ok, transporter} =
      attrs
      |> Enum.into(%{
        transporter_id: "some transporter_id",
        vehicle_id: "some vehicle_id"
      })
      |> Project1.Transporters.create_transporter()

    transporter
  end

  @doc """
  Generate a transporter.
  """
  def transporter_fixture(attrs \\ %{}) do
    {:ok, transporter} =
      attrs
      |> Enum.into(%{
        name: "some name",
        npwp_number: "some npwp_number",
        phone_number: "some phone_number",
        status: "some status"
      })
      |> Project1.Transporters.create_transporter()

    transporter
  end
end
