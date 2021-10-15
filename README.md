# Wabanex

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


---

Cria a migration com o comando:
 . mix ecto.gen.migration {name}
Cria o schema em 'wabanex', com nome no singular
Cria uma pasta em 'wabanex' no plural com os arquivos que representam as funções (get, create, delete, update)

////////////////////////////////

Informações importantes:

## Como executar

- Clone o repositório
- Instale o phoenix `mix archive.install hex phx_new 1.5.9`
- Instale as dependencias do projeto `mix deps.get`
- Instale a database e rode as migrations `mix ecto.setup`
- Inicie o servidor do phoenix `mix phx.server`
- Por fim, caso precise você pode alterar as configurações do banco de dados pelo arquivo `dev.exs` e no arquivo `config/test.exs`
- Por fim, a aplicação estará disponível em `http://localhost:4000`


///

Criar novos campos no usuario como:
 - altura: number
 - peso: number
 - indice de gordura: number
 - indice muscular: number

 (alter table, create column)

Criar mutations para deleção e alteração dos usuarios e treinos
 (Repo delete e Repo update)

Cobrir todos os testes restantes
 - mix test --cover
 - excoveralls (lib)