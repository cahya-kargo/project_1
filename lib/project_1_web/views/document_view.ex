defmodule Project1Web.DocumentView do
  use Project1Web, :view
  alias Project1Web.DocumentView

  def render("index.json", %{documents: documents}) do
    %{data: render_many(documents, DocumentView, "document.json")}
  end

  def render("show.json", %{document: document}) do
    %{data: render_one(document, DocumentView, "document.json")}
  end

  def render("document.json", %{document: document}) do
    %{
      id: document.id,
      type: document.type,
      phone_document_url: document.phone_document_url,
      reference_id: document.reference_id
    }
  end
end
