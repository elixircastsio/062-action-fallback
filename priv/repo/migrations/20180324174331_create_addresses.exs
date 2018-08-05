defmodule Teacher.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :name, :string
      add :line, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :country, :string
      add :album_id, references(:albums, on_delete: :nothing)

      timestamps()
    end

    create index(:addresses, [:album_id])
  end
end
