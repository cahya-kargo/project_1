defmodule Project1Web.Schema do
  use Absinthe.Schema
  alias Project1.Resolvers

  import_types(Project1.Schema.Transporter)
  import_types(Project1.Schema.Vehicle)

  query do

    @desc "Get all transporters"
    field :transporter, list_of(:transporter) do
      resolve &Resolvers.Transporter.list_transporters/3
    end

    @desc "Get all vehicle"
    field :vehicle, list_of(:vehicle) do
      resolve &Resolvers.Vehicle.list_vehicles/3
    end
  end

  mutation do
    field :create_transporter, :transporter do
      arg(:input, :transporter_input)
      resolve(&Resolvers.Transporter.create_transporters/3)
    end

    field :create_vehicle, :vehicle do
      arg(:input, :vehicle_input)
      resolve(&Resolvers.Vehicle.create_vehicle/3)
    end

    field :create_vehicle_status, :response do
      arg(:input, :vehicle_input)
      resolve(&Resolvers.Transporter.change_status/3)
    end

    field :change_transporter_status, :response  do
      arg(:input, :transporter_status)
      resolve(&Resolvers.Transporter.change_status/3)
    end
  end

end
