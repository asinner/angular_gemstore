(function() {
	var app = angular.module('gemStore');
	
	app.factory('AuthService', function($q, $http, $cookieStore, Session) {
		var authService = {};
		
		authService.login = function(credentials) {
			var deferred = $q.defer();
			
			$http.post('/sign-in', credentials).then(
				function(response, status) {
					Session.create(response.data.token);
					$cookieStore.put('token', response.data.token);
					$cookieStore.put('admin', response.data.admin);
					deferred.resolve(response.data.admin);
				},
				function(response, status) {
					deferred.reject(response.data.msg);
				}
			);
			
			return deferred.promise;
			//return $http.post('/sign-in', credentials).then(
				
					
			//return $http.post('/admin/sign_in', credentials).then(function(response) {
			//	Session.create(response.data.id, response.data.user.id, response.data.user.role);
			//	return response.data.user;
			//});
		}
		
		authService.logout = function() {
			Session.destroy();
			$cookieStore.put('token', null);
			$cookieStore.put('admin', null);
		}
		
		authService.loginFromCookieStore = function() {
			var deferred = $q.defer();
			
			var token = $cookieStore.get('token');
			var admin = $cookieStore.get('admin');
			if (token && admin) {
				Session.create(token);
				deferred.resolve(admin);
			};
			
			return deferred.promise;
		}
		
		authService.isAuthenticated = function() {
			return !!Session.token;
		}
		
		authService.isAuthorized = function(authorizedRoles) {
			if (!angular.isArray(authorizedRoles)) {
				authorizedRoles = [authorizedRoles];
			}
			
			return (authService.isAuthenticated() && authorizedRoles.indexOf(Session.userRole) !== -1);
		}
				
		return authService;
	});
})()