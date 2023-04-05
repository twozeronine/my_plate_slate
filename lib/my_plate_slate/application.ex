defmodule MyPlateSlate.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyPlateSlate.Repo,
      MyPlateSlateWeb.Telemetry,
      {Phoenix.PubSub, name: MyPlateSlate.PubSub},
      MyPlateSlateWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    MyPlateSlateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
