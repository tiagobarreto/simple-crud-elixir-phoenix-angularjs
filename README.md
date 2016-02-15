Simple Crud using Elixir, Phoenix and Angular JS
=================================================
This example is upgrade of <b>Simple Crud in Angular JS</b> <b>[tutorial](https://github.com/tiagobarreto/simple-crud-angular-js)</b> from my <b>[blog](http://tiagobarreto.com)</b>. This is a <b>shopping list</b> with filter, delete and edit products.

Information about the install Erlang VM, Elixir and Phoenix in my <b>[blog](http://www.tiagobarreto.com/muito-prazer-elixir-e-phoenix/)</b>. 

Install and start project
-----------------------------
- Install dependencies with <code>mix deps.get</code>
- Create and migrate your database with <code>mix ecto.create</code> && <code>mix ecto.migrate</code>. This project uses MySQL but your can to use PostgreSQL, SQLite, etc, just change the adapter in your configurations.
- Install Node.js dependencies with <code>npm install</code>
- Start project with <code>mix phoenix.server</code>
- Now you can visit http://localhost:4000 from your browser.

List Products in Controller
-----------------------------------
List products model defined by <b>controller.js</b> in Angular JS (<b>GET</b> http://localhost:4000/api/products):

<pre>
  $http({method: 'GET', url: 'api/products?format=json'}).then(
        function successCallback(response) {
            $scope.itens = response.data.data;
        },
        function errorCallback(response) {
            toastr.error("Error for loading products in your shopping list");
  });
</pre>

List Products in View
-----------------------------------
Show products in <b>view</b>:

![List Products](https://github.com/tiagobarreto/simple-crud-angular-js/blob/master/img/docs/list-products.png)

<pre>
	&lt;div ng-controller="ListaComprasController"&gt;
		&lt;table&gt;
  			&lt;thead&gt;
    			&lt;tr&gt;
      				&lt;th&gt;Produto&lt;/th&gt;
      				&lt;th&gt;Quantidade&lt;/th&gt;
    			&lt;/tr&gt;
  			&lt;/thead&gt;
  			&lt;tbody&gt;
    			&lt;tr ng-repeat="item in itens"&gt;
      				&lt;td&gt;&lt;strong&gt;{{ item.produto }}&lt;/strong&gt;&lt;/td&gt;
      				&lt;td&gt;{{ item.quantidade }}&lt;/td&gt;
    			&lt;/tr&gt;
  			&lt;/tbody&gt;
		&lt;/table&gt;
	&lt;/div&gt;
</pre>

Filter Products in View
-----------------------------------
Added the filter attr in the ng-repeat to enabled filter:

![Filter Product](https://github.com/tiagobarreto/simple-crud-angular-js/blob/master/img/docs/filter-products.png)

<code>&lt;tr ng-repeat="item in items | filter:search"&gt;</code>

Also added a input text to search products:

<code>&lt;input type="search" ng-model="search" placeholder="Search by…"&gt;</code>


Add Products
-----------------------------------
Add products in <b>view</b>:

<pre>
	&lt;form name="products"&gt;
    	&lt;input type="text" ng-model="item.product"&gt;
    	&lt;input type="number" ng-model="item.amount"&gt;
    	&lt;button ng-click="addItem()">add item&lt;/button&gt;
	&lt;/form&gt;
</pre>

Functions in <b>controller.js</b> (<b>POST</b> http://localhost:4000/api/products):

<code>Add item in the items array</code>
<pre>
	$scope.addItem = function () {
        $http({method: 'POST', url: 'api/products/', data: { 'products' : $scope.item }}).then(
            function successCallback(response) {
                $scope.itens.push(response.data.data);
                $scope.item.produto = $scope.item.quantidade = '';
                toastr.success("Item added.");
            },
            function errorCallback(response) {
                toastr.error("Error for add product.");
        });
    };
</pre>

Remove Products
-----------------------------------
Remove products in <b>view</b>:

<pre>
	&lt;button class="btn btn-danger btn-small" ng-click="deleteItem($index)"&gt;
    	&lt;i class="icon-trash icon-white"&gt;&lt;/i&gt; remove
	&lt;/button&gt;
</pre>

Function to delete item in <b>Controller.js</b> (<b>DELETE</b> http://localhost:4000/api/products/{id}):

<pre>
  $scope.deleteItem = function(index){
        $http({method: 'DELETE', url: 'api/products/' + $scope.itens[index].id}).then(
            function successCallback(response) {
                $scope.itens.splice(index, 1);
                toastr.success("Item removed.");
            },
            function errorCallback(response) {
                toastr.error("Error for remove product.");
        });
  };
</pre>


Edit Products
-----------------------------------
![Edit Product](https://github.com/tiagobarreto/simple-crud-angular-js/blob/master/img/docs/edit-products.png)

Edit products used the main button from form to change the product with the <code>ng-hide</code> and <code>ng-show</code> in view and your controller (<b>PUT</b> http://localhost:4000/api/products/{id})::

<pre>
	$scope.editItem = function(index){
    	$http({method: 'PUT', url: 'api/products/' + $scope.item.id, data: { 'products' : $scope.item }}).then(
            function successCallback(response) {
                $scope.item = {};
                $scope.edit = false;
                toastr.success("Item saved.");
            },
            function errorCallback(response) {
                toastr.error("Error for edit product.");
        });
	};
</pre>

Libs used by example
--------------------------------------------
   * <b>Bootstrap</b>
      * Version: [3.0.0](https://github.com/twbs/bootstrap/archive/v3.0.0.zip)
 
   * <b>Toastr</b>
      * Version: [2.0.0](https://github.com/CodeSeven/toastr/blob/master/toastr.js)
      
   * <b>jQuery</b>
      * Version: [2.2.0](http://code.jquery.com/jquery-2.2.0.js)
