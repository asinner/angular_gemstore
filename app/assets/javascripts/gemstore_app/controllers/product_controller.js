(function() {
	var app = angular.module('gemStore');
  
	app.controller('ProductCtrl', ['$scope', '$http', 'Session', function($scope, $http, Session) {
		$scope.newProduct = {};
				
		$scope.create = function() {
			$http({
				method: 'POST',
				url: '/api/products',
				data: {
					product: $scope.newProduct,
					token: Session.token
				}
			})
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
				data: { 
					product: $scope.product,
					token: Session.token
				}
			})
			.success(function(data, status) {
				$scope.showEditProductForm = false;
				console.log([data, status]);
			})
			.error(function() {
				console.log([data, status]);					
			});
		}
		
		$scope.destroy = function() {
			$http({
				method: 'DELETE',
				url: '/api/products/' + $scope.product.id,
				data: {
					token: Session.token
				},
				headers: {
					'Content-Type': 'application/json'
				}
			})
			.success(function(data, status) {
				$scope.products.splice($scope.products.indexOf($scope.product), 1);				
			})
			.error(function(data, status) {
				console.log([data, status]);
			});
		};
	
	}]);
})()
