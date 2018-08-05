defmodule Teacher.Records.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias Teacher.Records.Album

  schema "albums" do
    field :artist, :string
    field :summary, :string
    field :title, :string
    field :year, :string
    field :price, :integer
    field :purchase_id, :string

    timestamps()
  end

  @doc false
  def changeset(%Album{} = album, attrs) do
    album
    |> cast(attrs, [:title, :summary, :year, :price, :purchase_id])
    |> validate_required([:title, :summary, :year, :price])
  end
end
