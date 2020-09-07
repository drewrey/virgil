defmodule VirgilWeb.PageController do
  use VirgilWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
