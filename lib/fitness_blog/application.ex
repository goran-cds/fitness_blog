defmodule FitnessBlog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FitnessBlogWeb.Telemetry,
      # Start the Ecto repository
      FitnessBlog.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FitnessBlog.PubSub},
      # Start Finch
      {Finch, name: FitnessBlog.Finch},
      # Start the Endpoint (http/https)
      FitnessBlogWeb.Endpoint
      # Start a worker by calling: FitnessBlog.Worker.start_link(arg)
      # {FitnessBlog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FitnessBlog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FitnessBlogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
