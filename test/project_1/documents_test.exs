defmodule Project1.DocumentsTest do
  use Project1.DataCase

  alias Project1.Documents

  describe "documents" do
    alias Project1.Documents.Document

    import Project1.DocumentsFixtures

    @invalid_attrs %{phone_document_url: nil, reference_id: nil, type: nil}

    test "list_documents/0 returns all documents" do
      document = document_fixture()
      assert Documents.list_documents() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Documents.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      valid_attrs = %{phone_document_url: "some phone_document_url", reference_id: 42, type: "some type"}

      assert {:ok, %Document{} = document} = Documents.create_document(valid_attrs)
      assert document.phone_document_url == "some phone_document_url"
      assert document.reference_id == 42
      assert document.type == "some type"
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      update_attrs = %{phone_document_url: "some updated phone_document_url", reference_id: 43, type: "some updated type"}

      assert {:ok, %Document{} = document} = Documents.update_document(document, update_attrs)
      assert document.phone_document_url == "some updated phone_document_url"
      assert document.reference_id == 43
      assert document.type == "some updated type"
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_document(document, @invalid_attrs)
      assert document == Documents.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Documents.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Documents.change_document(document)
    end
  end
end
