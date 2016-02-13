defmodule SimpleCrudPhoenix.ProductsView do
  use SimpleCrudPhoenix.Web, :view

  def render("index.json", %{products: products}) do
    %{data: render_many(products, SimpleCrudPhoenix.ProductsView, "products.json")}
  end

  def render("show.json", %{products: products}) do
    %{data: render_one(products, SimpleCrudPhoenix.ProductsView, "products.json")}
  end

  def render("products.json", %{products: products}) do
    %{id: products.id,
      produto: products.produto,
      quantidade: products.quantidade,
      comprado: products.comprado}
  end
end
