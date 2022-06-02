defmodule Project1.Resolvers.Trasnporter do

  def list_transporters(_parent, _args, _resolution) do
    {:ok, Project1.Transporters.list_transporter()}
  end

end
