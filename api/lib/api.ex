defmodule Api do
  def main(_argv) do
    IO.puts("Escolha uma opção:")
    IO.puts("1. Obter estatísticas globais de criptomoedas.")
    IO.puts("2. Recuperar dados de cotação para várias criptomoedas.")
    IO.puts("3. Recuperar dados de cotação para uma criptomoeda específica.")
    IO.puts("4. Recuperar as 50 principais exchanges e mercados para uma moeda específica.")
    IO.puts("5. Obter todas as exchanges listadas na plataforma.")
    IO.puts("6. Obter uma exchange específica por ID.")
    IO.puts("7. Obter estatísticas sociais para uma moeda específica.")

    option = IO.gets("Digite sua escolha: ") |> String.trim()

    case option do
      "1" -> obtem_global_stats()
      "2" -> obtem_tickers()
      "3" -> obtem_ticker()
      "4" -> obtem_markets()
      "5" -> obtem_exchanges()
      "6" -> obtem_exchange()
      "7" -> obtem_social_stats()
      _ -> IO.puts("Opção inválida!")
    end
  end

  defp obtem_global_stats() do
    CoinLore.obtem_url("global/")
    |> mostra_resultado()
  end

  defp obtem_tickers() do
    CoinLore.obtem_url("tickers/")
    |> mostra_resultado()
  end

  defp obtem_ticker() do
    ticker_id = IO.gets("Insira o ID da moeda: ") |> String.trim()

    CoinLore.obtem_url("ticker/?id=#{ticker_id}")
    |> mostra_resultado()
  end

  defp obtem_markets() do
    coin_id = IO.gets("Insira o ID da moeda: ") |> String.trim()

    CoinLore.obtem_url("coin/markets/?id=#{coin_id}")
    |> mostra_resultado()
  end

  defp obtem_exchanges() do
    CoinLore.obtem_url("exchanges/")
    |> mostra_resultado()
  end

  defp obtem_exchange() do
    exchange_id = IO.gets("Insira o ID da exchange: ") |> String.trim()

    CoinLore.obtem_url("exchange/?id=#{exchange_id}")
    |> mostra_resultado()
  end

  defp obtem_social_stats() do
    coin_id = IO.gets("Insira o ID da moeda: ") |> String.trim()

    CoinLore.obtem_url("coin/social_stats/?id=#{coin_id}")
    |> mostra_resultado()
  end

  defp mostra_resultado({:ok, body}) do
    IO.puts("Resposta recebida:")
    IO.puts(body)
    salvar_json(body)
  end

  defp mostra_resultado({:error, reason}) do
    IO.puts("Ocorreu um erro: #{reason}")
  end

  defp salvar_json(json) do
    File.write!("resposta_api.json", json)
    IO.puts "JSON salvo em resposta_api.json"
  end

end
