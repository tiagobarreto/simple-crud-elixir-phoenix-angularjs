defmodule SimpleCrudPhoenix.ProductsTest do
  use SimpleCrudPhoenix.ModelCase

  alias SimpleCrudPhoenix.Products

  @valid_attrs %{comprado: true, produto: "some content", quantidade: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Products.changeset(%Products{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Products.changeset(%Products{}, @invalid_attrs)
    refute changeset.valid?
  end
end
