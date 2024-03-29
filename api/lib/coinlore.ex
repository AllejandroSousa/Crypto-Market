defmodule CoinLore do
  @url "https://api.coinlore.net/api/"

  def obtem_url(endpoint) do
    HTTPoison.get(@url <> endpoint)
    |> processa_resposta
  end

  defp processa_resposta({:ok, %HTTPoison.Response{status_code: 200, body: b}}) do
    {:ok, b}
  end

  defp processa_resposta({:ok, %HTTPoison.Response{status_code: _, body: b}}) do
    {:error, b}
  end

  defp processa_resposta({:error, r}) do
    {:error, r}
  end
end
