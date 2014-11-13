(function() {
	var app = angular.module('gemStore');
	
	app.controller('ApplicationController', function($scope, AuthService) {
		$scope.currentAdmin = null;
		$scope.setCurrentAdmin = function(admin) {
			$scope.currentAdmin = admin;
		};
		$scope.initialize = function() {
			AuthService.loginFromCookieStore().then(
				function(admin) {
					$scope.setCurrentAdmin(admin);
				}
			);
		};
		$scope.logout = function() {
			AuthService.logout();
			$scope.setCurrentAdmin(null);
		};
		$scope.initialize();
	});
})()
