defmodule Product.Repo.Migrations.AddProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :description, :string
    end
  end
end
