defmodule TutorialLvnSwiftuiInteraction.Tsukumijima do
  @kurume_url "https://weather.tsukumijima.net/api/forecast/city/400040"

  def get_weather() do
    with {:ok, %Finch.Response{status: 200, body: body}} <-
           Finch.build(
             :get,
             @kurume_url
           )
           |> Finch.request(TutorialLvnSwiftuiInteraction.Finch),
         %{"description" => %{"text" => weather_text}} <- Jason.decode!(body) do
      {:ok, weather_text}
    else
      _ ->
        {:error, "天気予報を取得できませんでした。"}
    end
  end
end
