use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :simple_crud_phoenix, SimpleCrudPhoenix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :simple_crud_phoenix, SimpleCrudPhoenix.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "simple_crud_phoenix",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
