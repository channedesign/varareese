(function() {

	var videosServices = angular.module('VideosServices', ['ngResource']);

	videosServices.factory('Videos', ['$resource', function($resource) {
		return $resource('/videos/:id', {id: '@id'}, {update: {method: 'PUT'}});
	}])
		.factory('VideosEdit', ['$resource', function($resource) {
			return $resource('/videos/:id/edit', {id: '@id'}, {update: {method: 'PUT'}});
		}])
		.factory('VideosCat', ['$resource', function($resource) {
			return $resource('/video_categories/:id', {id: '@id'}, {update: {method: 'PUT'}});
		}])

})();