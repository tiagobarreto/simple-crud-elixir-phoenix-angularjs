defmodule SimpleCrudPhoenix.Products do
  use SimpleCrudPhoenix.Web, :model

  schema "products" do
    field :produto, :string
    field :quantidade, :integer
    field :comprado, :boolean, default: false

    timestamps
  end

  @required_fields ~w(produto quantidade comprado)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
