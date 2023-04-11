defmodule MyPlateSlateWeb.Router do
  use MyPlateSlateWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MyPlateSlateWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: MyPlateSlateWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: MyPlateSlateWeb.Schema,
      interface: :simple,
      socket: MyPlateSlateWeb.UserSocket
  end

  scope "/", MyPlateSlateWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MyPlateSlateWeb.Telemetry
    end
  end
end
