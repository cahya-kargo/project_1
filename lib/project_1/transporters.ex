defmodule Project1.Transporters do
  @moduledoc """
  The Transporters context.
  """

  import Ecto.Query, warn: false
  alias Project1.Repo

  alias Project1.Transporters.Transporter

  @doc """
  Returns the list of transporter.

  ## Examples

      iex> list_transporter()
      [%Transporter{}, ...]

  """
  def list_transporter do
    Repo.all(Transporter)
  end

  @doc """
  Gets a single transporter.

  Raises `Ecto.NoResultsError` if the Transporter does not exist.

  ## Examples

      iex> get_transporter!(123)
      %Transporter{}

      iex> get_transporter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transporter!(id), do: Repo.get!(Transporter, id)

  @doc """
  Creates a transporter.

  ## Examples

      iex> create_transporter(%{field: value})
      {:ok, %Transporter{}}

      iex> create_transporter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transporter(attrs \\ %{}) do
    %Transporter{}
    |> Transporter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transporter.

  ## Examples

      iex> update_transporter(transporter, %{field: new_value})
      {:ok, %Transporter{}}

      iex> update_transporter(transporter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transporter(%Transporter{} = transporter, attrs) do
    IO.inspect(transporter)
    transporter
    |> Transporter.changeset(attrs)
    |> Repo.update()
  end


  def check_is_active(id)
  do
    query = from t in "transporters",
          where: t.id == ^id and t.status == "validated",
          select: t.id
    Repo.one(query)
  end
  @doc """
  Deletes a transporter.

  ## Examples

      iex> delete_transporter(transporter)
      {:ok, %Transporter{}}

      iex> delete_transporter(transporter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transporter(%Transporter{} = transporter) do
    Repo.delete(transporter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transporter changes.

  ## Examples

      iex> change_transporter(transporter)
      %Ecto.Changeset{data: %Transporter{}}

  """
  def change_transporter(%Transporter{} = transporter, attrs \\ %{}) do
    Transporter.changeset(transporter, attrs)
  end


end
