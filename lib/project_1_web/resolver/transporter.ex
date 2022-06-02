defmodule Project1.Resolvers.Transporter do

  def list_transporters(_parent, _args, _resolution) do
    {:ok, Project1.Transporters.list_transporter()}
  end

  @spec create_transporters(
          any,
          %{
            :input => :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
            optional(any) => any
          },
          any
        ) :: any
  def create_transporters(_parent, %{input: params}, _resolution) do
    Project1.Transporters.create_transporter(params)
    # {:error, "Something went wrong"}
  end

  @spec change_status(any, %{:input => map, optional(any) => any}, any) :: {:ok, any}
  def change_status(_parent, %{input: params}, _resolution) do
    IO.inspect(params[:id])
    transporter = Project1.Transporters.get_transporter!(params[:id])
    Project1.Transporters.update_transporter(transporter, params)
    {:ok, %{success: true}}
    # {:error, "Something went wrong"}
  end

end
