defmodule TestVixBurritoWeb.PageController do
  use TestVixBurritoWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
