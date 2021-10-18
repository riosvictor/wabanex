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
Roda a migration com o comando:
 . mix ecto.migrate
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

Criar novos campos no usuário como:
 - height: float
 - weight: float
 - fat_index: float, default: 0
 - muscle_index: float, default: 0
 (alter table, add column)
 - DONE

Criar mutations para remoção e alteração dos usuários e treinos
 (Repo delete e Repo update)
 - PENDING

 - Cobrir todos os testes restantes (PENDING)
 - add lib excoveralls (DONE)
 - run on terminal: MIX_ENV=test mix coveralls.html