defmodule HelloWorldWeb.HealthController do
  use HelloWorldWeb, :controller

  def index(conn, _params) do
    json(conn, %{status: "I am alive"})
  end
end
