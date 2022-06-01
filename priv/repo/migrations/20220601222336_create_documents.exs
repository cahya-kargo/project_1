defmodule Project1.Repo.Migrations.CreateDocuments do
  use Ecto.Migration

  def change do
    create table(:documents) do
      add :type, :string
      add :phone_document_url, :string
      add :reference_id, references("transporters")

      timestamps()
    end
  end
end
