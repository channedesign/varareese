(function() {

	var varaApp = angular.module('VaraApp', [
		'ngRoute', 
		'templates',
		'VideosController',
		'VideosServices'
		]);

	varaApp.config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
		$httpProvider.defaults.headers.common.Accept = "application/json";
		$routeProvider.
			when('/', {
				templateUrl: 'index.html',	
			}).
			when('/photos', {
				templateUrl: 'photos.html',
				controller: 'photosCtrl',
			}).
			when('/videos', {
				templateUrl: 'videos.html',
				controller: 'videosCtrl',
			}).
			when('/videos/:id/edit', {
				templateUrl: 'video_edit.html',
				controller: 'videosEditCtrl',
			}).
			otherwise({redirectTo: '/'});
	}])

})();
