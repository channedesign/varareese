(function() {

	var videosServices = angular.module('PhotosServices', ['ngResource']);

	videosServices.factory('Photos', ['$resource', function($resource) {
		return $resource('/photos/:id/:edit', {id: '@id', edit: '@edit'}, {update: {method: 'PUT'}});
	}])
		.factory('PhotosCat', ['$resource', function($resource) {
			return $resource('/photo_categories/:id/:edit', {id: '@id', edit: '@edit'}, {update: {method: 'PUT'}});
		}])

})();