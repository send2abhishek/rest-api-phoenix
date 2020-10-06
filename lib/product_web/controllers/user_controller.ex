defmodule ProductWeb.UserController do
  use ProductWeb, :controller

  alias Product.Repo
  alias Product.Users


  def create(conn, %{"name" => name, "email" => email, "password" => password, "phone" => phone}) do

    users=%{name: name, email: email, password: password, phone: phone}
    changeset=Users.changeset(%Users{},users)
    case Repo.get_by(Users, email: email) do
    nil ->
        case Repo.insert(changeset) do

          {:ok, _post} ->
            conn
            |> put_status(:created)
            |> render("show.json", %{user: "User Registered"})

          {:error, _changeset} ->
            conn
            |> put_status(:not_found)
            |> render("error.json")

        end

      _ ->
      conn
      |> put_status(:conflict)
      |> render("error.json", %{user: "User Already Register"})

    end

  end
end
