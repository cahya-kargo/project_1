defmodule Project1Web.Schema do
  use Absinthe.Schema
  alias Project1.Resolvers

  import_types(Project1.Schema.Transporter)
  query do

    @desc "Get all transporters"
    field :transporter, list_of(:transporter) do
      resolve &Resolvers.Transporter.list_transporters/3
    end

  end

  mutation do
    field :create_transporter, :transporter do
      arg(:input, :transporter_input)
      resolve(&Resolvers.Transporter.create_transporters/3)
    end

    field :change_transporter_status, :transporter do
      arg(:input, :transporter_status)
      resolve(&Resolvers.Transporter.change_status/3)
    end
  end

end
