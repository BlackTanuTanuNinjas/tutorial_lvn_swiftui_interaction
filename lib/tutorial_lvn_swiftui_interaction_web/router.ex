defmodule TutorialLvnSwiftuiInteractionWeb.Router do
  use TutorialLvnSwiftuiInteractionWeb, :router

  pipeline :browser do
    plug :accepts, [
      "html",
      "swiftui"
    ]

    plug :fetch_session
    plug :fetch_live_flash

    plug :put_root_layout,
      html: {TutorialLvnSwiftuiInteractionWeb.Layouts, :root},
      swiftui: {TutorialLvnSwiftuiInteractionWeb.Layouts.SwiftUI, :root}

    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TutorialLvnSwiftuiInteractionWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/elixir_actions", ElixirActionsLive
    live "/swift_actions", SwiftActionsLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", TutorialLvnSwiftuiInteractionWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:tutorial_lvn_swiftui_interaction, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TutorialLvnSwiftuiInteractionWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
