defmodule Project1.Schema.Vehicle do
  use Absinthe.Schema.Notation

  object :vehicle do
    field :id, :integer
    field :vehicle_plate, :string
    field :status, :string
    field :transporter_id, :integer
    field :transporter, :transporter
  end


  input_object :vehicle_input do
    field :vehicle_plate, :string
    field :transporter_id, :integer
  end

  input_object :vehicle_status do
    field :id, :integer
    field :status, :string
  end
end
