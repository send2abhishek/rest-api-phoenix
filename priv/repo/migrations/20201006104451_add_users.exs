defmodule Product.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:userDetails) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :phone, :integer
    end
  end
end
