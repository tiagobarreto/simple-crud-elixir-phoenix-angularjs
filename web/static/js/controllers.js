function AppController($scope, $http) {

    $scope.item = {};

    // List Products
    $http({method: 'GET', url: 'api/products?format=json'}).then(
        function successCallback(response) {
            $scope.itens = response.data.data;
        },
        function errorCallback(response) {
            toastr.error("Ocorreu um erro ao carregar lista de produtos.");
    });

    // Add Product Item
    $scope.adicionaItem = function () {
        $http({method: 'POST', url: 'api/products/', data: { 'products' : $scope.item }}).then(
            function successCallback(response) {
                $scope.itens.push(response.data.data);
                $scope.item.produto = $scope.item.quantidade = '';
                toastr.success("Item adicionado.");
            },
            function errorCallback(response) {
                toastr.error("Ocorreu um erro ao adicionar o produto.");
        });
    };

    // Edit Product Item
    $scope.editarItem = function(index){
        $scope.item = $scope.itens[index];
        $scope.edit = true;
    };

    // Save Product Item
    $scope.applyChanges = function(index){
        $http({method: 'PUT', url: 'api/products/' + $scope.item.id, data: { 'products' : $scope.item }}).then(
            function successCallback(response) {
                $scope.item = {};
                $scope.edit = false;
                toastr.success("Item alterado.");
            },
            function errorCallback(response) {
                toastr.error("Ocorreu um erro ao alterar o produto.");
        });
    };

    // Delete Product Item
    $scope.deleteItem = function(index){
        $http({method: 'DELETE', url: 'api/products/' + $scope.itens[index].id}).then(
            function successCallback(response) {
                $scope.itens.splice(index, 1);
                toastr.success("Item deletado com sucesso.");
            },
            function errorCallback(response) {
                toastr.error("Ocorreu um erro ao deletar o produto.");
        });
    };
}