(function() {
	var app = angular.module('gemStore');
	
	app.controller('LoginController', function($scope, $location, $rootScope, AUTH_EVENTS, AuthService) {
		
		$scope.credentials = {
			name: '',
			password: ''
		};
	
		$scope.login = function(credentials) {			
			AuthService.login(credentials).then(
				function(admin) {
					$rootScope.$broadcast(AUTH_EVENTS.loginSuccess);
					$location.path('/');
					$scope.setCurrentAdmin(admin);
				},
				function(error) {
					$rootScope.$broadcast(AUTH_EVENTS.loginFailed, error);
				}
			);
			
						
			//AuthService.login(credentials).then(function(user) {
			//	$rootScope.$broadcast(AUTH_EVENTS.loginSuccess);
			//	$scope.setCurrentUser(user);
			//}, function() {
			//	$rootScope.$broadcast(AUTH_EVENTS.loginFailed);
			//});
		};
	});
	
})()