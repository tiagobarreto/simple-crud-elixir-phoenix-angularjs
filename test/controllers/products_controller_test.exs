defmodule SimpleCrudPhoenix.ProductsControllerTest do
  use SimpleCrudPhoenix.ConnCase

  alias SimpleCrudPhoenix.Products
  @valid_attrs %{comprado: true, produto: "some content", quantidade: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, products_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = get conn, products_path(conn, :show, products)
    assert json_response(conn, 200)["data"] == %{"id" => products.id,
      "produto" => products.produto,
      "quantidade" => products.quantidade,
      "comprado" => products.comprado}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, products_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, products_path(conn, :create), products: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Products, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, products_path(conn, :create), products: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = put conn, products_path(conn, :update, products), products: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Products, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = put conn, products_path(conn, :update, products), products: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = delete conn, products_path(conn, :delete, products)
    assert response(conn, 204)
    refute Repo.get(Products, products.id)
  end
end
