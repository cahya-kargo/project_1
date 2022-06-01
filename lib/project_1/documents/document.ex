defmodule Project1.Documents.Document do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do
    field :phone_document_url, :string
    field :reference_id, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [:type, :phone_document_url, :reference_id])
    |> validate_required([:type, :phone_document_url, :reference_id])
  end
end
