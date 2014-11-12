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
		
		$scope.update = function() {
			$http({
				method: 'PATCH',
				url: '/api/products/' + $scope.product.id,
				data: $scope.product
			})
			.success(function(data, status) {
				console.log([data, status]);
			})
			.error(function() {
				console.log([data, status]);					
			});
		}
		
		$scope.destroy = function() {
			$http.delete('/api/products/' + $scope.product.id)
				.success(function(data, status) {
					$scope.products.splice($scope.products.indexOf($scope.product), 1);
					console.log([data, status]);
				})
				.error(function(data, status) {
					console.log([data, status]);
				});
		};
		
		
		
	}]);
})()
