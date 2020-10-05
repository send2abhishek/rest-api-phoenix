defmodule ProductWeb.MainView do
  use ProductWeb, :view

  def render("index.json", %{products: data}) do
    render_many(data, __MODULE__, "user.json")
  end
  def render("show.json", _data) do
    %{message: "Data Saved in database "}
  end
  def render("error.json", _data) do
    %{data: "something went wrong "}
  end

  def render("user.json", %{main: product}) do
    %{
      id: product.id,
      title: product.title,
      description: product.description
    }
  end

end
