defmodule Teacher.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :email, :string
      add :stripe_customer_id, :string
      add :encrypted_password, :string

      timestamps()
    end
  end
end
