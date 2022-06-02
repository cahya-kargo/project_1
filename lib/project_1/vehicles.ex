defmodule Project1.Vehicles do
  @moduledoc """
  The Vehicles context.
  """

  import Ecto.Query, warn: false
  alias Project1.Repo

  alias Project1.Vehicles.Vehicle
  alias Project1.Transporters

  @doc """
  Returns the list of vehicles.

  ## Examples

      iex> list_vehicles()
      [%Vehicle{}, ...]

  """
  def list_vehicles do
    query = Ecto.Query.from v in "vehicles",
            left_join: t in "transporters",
            on: v.transporter_id == t.id,
            select: %{id: v.id, transporter_id: v.transporter_id, vehicle_plate: v.vehicle_plate, status: v.status,
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
  Gets a single vehicle.

  Raises `Ecto.NoResultsError` if the Vehicle does not exist.

  ## Examples

      iex> get_vehicle!(123)
      %Vehicle{}

      iex> get_vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehicle!(id) do
    {id, ""} = Integer.parse(id)
    query = Ecto.Query.from v in "vehicles",
    left_join: t in "transporters",
    on: v.transporter_id == t.id,
    where: v.id == ^id,
    select: %{id: v.id, transporter_id: v.transporter_id, vehicle_plate: v.vehicle_plate, status: v.status,
    transporter: %{
      id: t.id,
      name: t.name,
      phone_number: t.phone_number,
      npwp_number: t.npwp_number
      }
    }
    Repo.one(query)
  end

  @doc """
  Creates a vehicle.

  ## Examples

      iex> create_vehicle(%{field: value})
      {:ok, %Vehicle{}}

      iex> create_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehicle(attrs \\ %{}) do
    %Vehicle{}
    |> Vehicle.changeset(attrs)
    # |> Transporters.check_is_active(attrs["id"])
    |> Repo.insert()
  end

  @doc """
  Updates a vehicle.

  ## Examples

      iex> update_vehicle(vehicle, %{field: new_value})
      {:ok, %Vehicle{}}

      iex> update_vehicle(vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehicle(%Vehicle{} = vehicle, attrs) do
    vehicle
    |> Vehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vehicle.

  ## Examples

      iex> delete_vehicle(vehicle)
      {:ok, %Vehicle{}}

      iex> delete_vehicle(vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehicle(%Vehicle{} = vehicle) do
    Repo.delete(vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehicle changes.

  ## Examples

      iex> change_vehicle(vehicle)
      %Ecto.Changeset{data: %Vehicle{}}

  """
  def change_vehicle(%Vehicle{} = vehicle, attrs \\ %{}) do
    Vehicle.changeset(vehicle, attrs)
  end
end
