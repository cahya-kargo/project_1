defmodule Project1.Repo.Migrations.AddUniqueIndexTransporter do
  use Ecto.Migration

  def change do
    create index("transporters",[:npwp_number], unique: true)
  end
end
