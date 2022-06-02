defmodule Project1.Resolvers.Vehicle do

  def list_vehicles(_parent, _args, _resolution) do
    {:ok, Project1.Vehicles.list_vehicles()}
  end

  def create_vehicle(_parent, %{input: params}, _resolution) do
    result = Project1.Vehicles.create_vehicle(params)
    # {:error, "Something went wrong"}
  end

  @spec change_status(any, %{:input => map, optional(any) => any}, any) :: {:ok, any}
  def change_status(_parent, %{input: params}, _resolution) do
    transporter = Project1.Vehicles.get_vehicle!(params[:id])
    Project1.Vehicles.update_vehicle(transporter, params)
    {:ok, %{success: true}}
    # {:error, "Something went wrong"}
  end

end
