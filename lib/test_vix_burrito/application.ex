defmodule TestVixBurrito.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TestVixBurritoWeb.Telemetry,
      TestVixBurrito.Repo,
      {DNSCluster, query: Application.get_env(:test_vix_burrito, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TestVixBurrito.PubSub},
      # Start a worker by calling: TestVixBurrito.Worker.start_link(arg)
      # {TestVixBurrito.Worker, arg},
      # Start to serve requests, typically the last entry
      TestVixBurritoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestVixBurrito.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestVixBurritoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
