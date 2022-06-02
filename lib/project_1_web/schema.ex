defmodule Project1.Schema do
  use Absinthe.Schema
  import_types Project1.Schema.Transporter

  alias Project1.Resolvers

  query do

    @desc "Get all transporters"
    field :transporter, list_of(:transporter) do
      resolve &Resolvers.Transporter.list_transporter/3
    end

  end

end
