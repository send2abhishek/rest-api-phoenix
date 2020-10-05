defmodule Product.ProductDetails do
  use ProductWeb, :model

  schema "products" do
    field :title, :string
    field :description, :string
  end

  # changeset function returns changeset
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
    |> validate_required([:title, :description])
  end
end
