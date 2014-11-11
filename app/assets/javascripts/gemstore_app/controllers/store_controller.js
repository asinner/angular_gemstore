(function() {
	var app = angular.module('gemStore');
	
	app.controller('StoreController', ['$http', '$scope', function($http, $scope) {
		$scope.products = [];

	  $http.get('products/gems.json').success(function(data) {
	  	$scope.products = data;
	  });
	
	}]);
})()
