defmodule Nip.PageController do
  use Nip.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
