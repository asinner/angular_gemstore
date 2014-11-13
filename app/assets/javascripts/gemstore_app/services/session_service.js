(function() {
	var app = angular.module('gemStore');
	
	app.service('Session', function() {
		this.create = function(token) {
			this.token = token;
		};
		
		this.destroy = function() {
			this.token = null;
		};
		
		return this;
	});
})()