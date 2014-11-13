(function() {
	var app = angular.module('gemStore');
	
	app.controller('FlashController', function($scope, AUTH_EVENTS) {
		
		$scope.messages = [];
		
		$scope.$on(AUTH_EVENTS.loginFailed, function(event, data) {
		
			var flash = {
				body: data,
				type: 'error'
			};
			
			$scope.messages.push(flash);
			
			setTimeout(function(flash) {
				$scope.$apply(function() {
					$scope.messages.splice($scope.messages.indexOf(flash, 1));
				});
			}, 5000);
			
		});
		
		$scope.$on(AUTH_EVENTS.loginSuccess, function(event) {
			
			var flash = {
				body: 'You have successfully logged in',
				type: 'success'
			};
			
			$scope.messages.push(flash);
			
			setTimeout(function(flash) {
				$scope.$apply(function() {
					$scope.messages.splice($scope.messages.indexOf(flash, 1));
				});
			}, 5000);
			
		});
		
	});
})()