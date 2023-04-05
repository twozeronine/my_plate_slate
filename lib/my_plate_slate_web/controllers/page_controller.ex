defmodule MyPlateSlateWeb.PageController do
  use MyPlateSlateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
