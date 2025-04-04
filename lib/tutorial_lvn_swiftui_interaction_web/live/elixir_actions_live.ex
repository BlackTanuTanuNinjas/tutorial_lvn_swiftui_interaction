defmodule TutorialLvnSwiftuiInteractionWeb.ElixirActionsLive do
  use TutorialLvnSwiftuiInteractionWeb, :live_view
  use TutorialLvnSwiftuiInteractionNative, :live_view

  alias TutorialLvnSwiftuiInteraction.Tsukumijima

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:weather_text, nil)}
  end

  def handle_event("get_weather", _params, socket) do
    case Tsukumijima.get_weather() do
      {:ok, weather_text} ->
        {:noreply,
         socket
         |> assign(:status, :ok)
         |> assign(:weather_text, weather_text)}

      {:error, message} ->
        {:noreply,
         socket
         |> assign(:status, :error)
         |> assign(:weather_text, message)}
    end
  end
end
