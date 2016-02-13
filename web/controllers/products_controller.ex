defmodule SimpleCrudPhoenix.ProductsController do
  use SimpleCrudPhoenix.Web, :controller

  alias SimpleCrudPhoenix.Products

  plug :scrub_params, "products" when action in [:create, :update]

  def index(conn, _params) do
    products = Repo.all(Products)
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"products" => products_params}) do
    changeset = Products.changeset(%Products{}, products_params)

    case Repo.insert(changeset) do
      {:ok, products} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", products_path(conn, :show, products))
        |> render("show.json", products: products)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SimpleCrudPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    products = Repo.get!(Products, id)
    render(conn, "show.json", products: products)
  end

  def update(conn, %{"id" => id, "products" => products_params}) do
    products = Repo.get!(Products, id)
    changeset = Products.changeset(products, products_params)

    case Repo.update(changeset) do
      {:ok, products} ->
        render(conn, "show.json", products: products)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SimpleCrudPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    products = Repo.get!(Products, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(products)

    send_resp(conn, :no_content, "")
  end
end
