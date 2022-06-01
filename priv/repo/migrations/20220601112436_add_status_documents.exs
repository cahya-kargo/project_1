defmodule Project1.Repo.Migrations.AddStatusDocuments do
  use Ecto.Migration

  def change do
    alter table("documents") do
      add :status, :string
    end
  end
end
