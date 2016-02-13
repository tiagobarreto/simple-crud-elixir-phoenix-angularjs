defmodule SimpleCrudPhoenix.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :produto, :string
      add :quantidade, :integer
      add :comprado, :boolean, default: false

      timestamps
    end

  end
end
