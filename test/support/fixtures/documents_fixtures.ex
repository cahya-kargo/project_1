defmodule Project1.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project1.Documents` context.
  """

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        phone_document_url: "some phone_document_url",
        reference_id: 42,
        type: "some type"
      })
      |> Project1.Documents.create_document()

    document
  end
end
