defmodule Project1.Schema.Transporter do
  use Absinthe.Schema.Notation

  object :transporter do
    field :name, :string
    field :npwp_number, :string
    field :phone_number, :string
    field :status, :string
  end
end
