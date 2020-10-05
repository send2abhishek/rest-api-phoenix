defmodule ProductWeb.MainController do

  use ProductWeb, :controller

  alias Product.Repo
  alias Product.ProductDetails

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _parms) do
    products = Repo.all(ProductDetails)
    conn
    |> put_status(:ok)
    |> render("index.json", products: products)

    # render(conn, "index.json", products: products)
  end

  def create(conn, %{"description" => desc, "name" => name}) do

    products=%{title: name, description: desc}

    changeset=ProductDetails.changeset(%ProductDetails{},products)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_status(:created)
        |> render("show.json")

      {:error, _changeset} ->
        render(conn, "error.json")
    end


  end
end
