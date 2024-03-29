## Projeto em Elixir para Consumir API de Criptomoedas

Este é um pequeno projeto em Elixir que consome a API da [Coinlore Cryptocurrency Data API](https://www.coinlore.com/cryptocurrency-data-api).

### Como Executar

1. Certifique-se de instalar as dependências necessárias. No diretório do arquivo `api`, digite o seguinte comando no terminal:

```bash
mix deps.get
```
2. Com as dependências instaladas, estando no terminal no mesmo diretório, execute o seguinte comando para compilar:

```bash
mix escript.build
```
3. Agora, para executar o arquivo, use o seguinte comando:

```bash
./api
```
*(No Windows, digite: `escript api`)*

### Utilização

Ao executar o arquivo, o programa irá solicitar ao usuário qual requisição ele deseja fazer para a API.
