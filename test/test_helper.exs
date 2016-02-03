ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SimpleCrudPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SimpleCrudPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SimpleCrudPhoenix.Repo)

