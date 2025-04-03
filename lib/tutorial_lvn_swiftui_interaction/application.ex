defmodule TutorialLvnSwiftuiInteraction.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TutorialLvnSwiftuiInteractionWeb.Telemetry,
      TutorialLvnSwiftuiInteraction.Repo,
      {DNSCluster,
       query:
         Application.get_env(:tutorial_lvn_swiftui_interaction, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TutorialLvnSwiftuiInteraction.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TutorialLvnSwiftuiInteraction.Finch},
      # Start a worker by calling: TutorialLvnSwiftuiInteraction.Worker.start_link(arg)
      # {TutorialLvnSwiftuiInteraction.Worker, arg},
      # Start to serve requests, typically the last entry
      TutorialLvnSwiftuiInteractionWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TutorialLvnSwiftuiInteraction.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TutorialLvnSwiftuiInteractionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
