(function() {
	var app = angular.module('gemStore');
  
	app.controller('ReviewController', ['$scope', function($scope) {
		$scope.review = {};
		
		$scope.addReview = function(product) {
			console.log('here');
			product.reviews.push('Andrew');
			$scope.review = {};
		};
	}]);
})()
