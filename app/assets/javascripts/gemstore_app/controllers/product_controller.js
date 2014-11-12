(function() {
	var app = angular.module('gemStore');
  
	app.controller('ProductCtrl', ['$scope', '$http', function($scope, $http) {
		$scope.newProduct = {};
		
		$scope.create = function() {
			$http.post('/api/products', $scope.newProduct)
				.success(function(data, status) {
					$scope.products.push($scope.newProduct);
					$scope.newProduct = {}
					$scope.newProductForm.$setPristine();
					console.log(data);
					console.log(status);
				})
				.error(function(data, status) {
					console.log(data);
					console.log(status);
				});
		};
		
		
		
	}]);
})()
