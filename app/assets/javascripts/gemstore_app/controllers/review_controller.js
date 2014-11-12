(function() {
	var app = angular.module('gemStore');
  
	app.controller('ReviewController', ['$scope', '$http', function($scope, $http) {
		$scope.review = {};
		
		$scope.addReview = function(product) {		
			$http.post('/api/products/' + product.id + '/reviews', $scope.review)
				.success(function(data, status) {
					product.reviews.push($scope.review);
					$scope.review = {};
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
