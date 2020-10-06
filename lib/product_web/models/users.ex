defmodule Product.Users do
  use ProductWeb, :model

  schema "userDetails" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :phone, :integer
  end

  # changeset function returns changeset
  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :password, :phone])
    |> validate_required([:name, :email, :password, :phone])
    # |> validate_length(:phone, max: 10)
  end
end
