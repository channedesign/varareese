(function() {

	var varaApp = angular.module('VaraApp', [
		'ngRoute', 
		'templates',
		'VideosController',
		'PhotosController',
		'AdminNavController',
		'VideosServices',
		'PhotosServices',
		'VideosDirectives',
		'PhotosDirectives',
		'TruncateFilter',
		'thatisuday.dropzone',
		'ui.sortable',
		'ngMessages'
		]);

	varaApp.config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
		delete $httpProvider.defaults.headers.common['X-Requested-With'];
		csrfToken = $('meta[name=csrf-token]').attr('content');
		$httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken;
		$httpProvider.defaults.headers.common.Accept = "application/json";
		$routeProvider.
			when('/', {
				templateUrl: 'index.html',	
			}).
			when('/photos', {
				templateUrl: 'photos.html',
				controller: 'photosCtrl',
			}).
			when('/photos/:id/edit', {
				templateUrl: 'photo_edit.html', 
				controller: 'photosEditCtrl',
			}).
			when('/videos', {
				templateUrl: 'videos.html',
				controller: 'videosCtrl',
			}).
			when('/videos/:id/edit', {
				templateUrl: 'video_edit.html',
				controller: 'videosEditCtrl',
			}).
			when('/crop/:id', {
				templateUrl: 'crop.html.erb'
			}).
			otherwise({redirectTo: '/'});
	}])

})();
