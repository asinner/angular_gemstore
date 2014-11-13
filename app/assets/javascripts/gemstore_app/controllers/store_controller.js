(function() {
	var app = angular.module('gemStore');
	
	app.controller('StoreController', ['$http', '$scope', function($http, $scope) {
		$scope.products = [];
	
		$http.get('/api/products')
			.success(function(data, status) {
				$scope.products = data['products'];
				console.log(status);
				console.log(data);
			})
			.error(function(data, status) {
				console.log(status);
				console.log(data);
			});
		
	}]);
})()
