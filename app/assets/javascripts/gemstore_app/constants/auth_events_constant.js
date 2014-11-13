(function() {
	var app = angular.module('gemStore');
	
	app.constant('AUTH_EVENTS', {
		loginSuccess: 'auth-login-success',
		loginFailed: 'auth-login-failed',
		logoutSuccess: 'auth-logout-success',
		sessionTimeout: 'auth-session-timeout',
		notAuthenticated: 'auth-not-authorized',
		notAuthorized: 'auth-not-authorized'
	});
})()