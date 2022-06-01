defmodule Project1.TransporterVehicles do
  @moduledoc """
  The TransporterVehicles context.
  """

  import Ecto.Query, warn: false
  alias Project1.Repo

  alias Project1.TransporterVehicles.TransporterVehicle

  @doc """
  Returns the list of transporter_vehicle.

  ## Examples

      iex> list_transporter_vehicle()
      [%TransporterVehicle{}, ...]

  """
  def list_transporter_vehicle do
    query = Ecto.Query.from tv in "transporter_vehicles",
            left_join: v in "vehicles",
            left_join: t in "transporters",
            on: tv.transporter_id == t.id,
            on: tv.vehicle_id == v.id,
            select: %{id: tv.id, transporter_id: tv.transporter_id, vehicle_id: tv.vehicle_id, vehicle: %{
              id: v.id,
              vehicle_plate: v.vehicle_plate,
              status: v.status
            },
            transporter: %{
              id: t.id,
              name: t.name,
              phone_number: t.phone_number,
              npwp_number: t.npwp_number
            }
          }
    Repo.all(query)
  end


  @doc """
  Gets a single transporter_vehicle.

  Raises `Ecto.NoResultsError` if the Transporter vehicle does not exist.

  ## Examples

      iex> get_transporter_vehicle!(123)
      %TransporterVehicle{}

      iex> get_transporter_vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transporter_vehicle!(id) do
    Repo.get!(TransporterVehicle, id)
  end


  @doc """
  Creates a transporter_vehicle.

  ## Examples

      iex> create_transporter_vehicle(%{field: value})
      {:ok, %TransporterVehicle{}}

      iex> create_transporter_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transporter_vehicle(attrs \\ %{}) do
    %TransporterVehicle{}
    |> TransporterVehicle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transporter_vehicle.

  ## Examples

      iex> update_transporter_vehicle(transporter_vehicle, %{field: new_value})
      {:ok, %TransporterVehicle{}}

      iex> update_transporter_vehicle(transporter_vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transporter_vehicle(%TransporterVehicle{} = transporter_vehicle, attrs) do
    transporter_vehicle
    |> TransporterVehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transporter_vehicle.

  ## Examples

      iex> delete_transporter_vehicle(transporter_vehicle)
      {:ok, %TransporterVehicle{}}

      iex> delete_transporter_vehicle(transporter_vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transporter_vehicle(%TransporterVehicle{} = transporter_vehicle) do
    Repo.delete(transporter_vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transporter_vehicle changes.

  ## Examples

      iex> change_transporter_vehicle(transporter_vehicle)
      %Ecto.Changeset{data: %TransporterVehicle{}}

  """
  def change_transporter_vehicle(%TransporterVehicle{} = transporter_vehicle, attrs \\ %{}) do
    TransporterVehicle.changeset(transporter_vehicle, attrs)
  end
end
