defmodule HelloWorldWeb.Router do
  use HelloWorldWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HelloWorldWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWorldWeb do
    pipe_through :browser
    get "/", PageController, :home
  end

  scope "/api", HelloWorldWeb do
    pipe_through :api

  

   
    get "/health", HealthController, :index  
  end

  if Application.compile_env(:hello_world, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HelloWorldWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
