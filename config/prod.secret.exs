use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :simple_crud_phoenix, SimpleCrudPhoenix.Endpoint,
  secret_key_base: "J0MXOa9EFlxTJ1omTH/QE8fZewUC8Hsa/CUkvFPqcH45hGJC2NBv9EQBDqpdBVsR"

# Configure your database
config :simple_crud_phoenix, SimpleCrudPhoenix.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "simple_crud_phoenix",
  pool_size: 20
