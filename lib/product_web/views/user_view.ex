defmodule ProductWeb.UserView do
  use ProductWeb, :view

  def render("show.json", %{user: data}) do
    %{message: data}
  end
  def render("error.json", %{user: data}) do
    %{message: data}
  end
end
