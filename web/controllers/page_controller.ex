defmodule SimpleCrudPhoenix.PageController do
  use SimpleCrudPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
