(function() {

	var videosController = angular.module('VideosController', []);

	videosController.controller('videosCtrl', ['$scope', 'Videos', 'VideosCat', function($scope, Videos, VideosCat) {
		$scope.videos = Videos.query();
		$scope.videosCat = VideosCat.query();
		$scope.showForm = false;
		
		$scope.addVideo = function() {
			var video = Videos.save($scope.newVideo);
			$scope.videos.push(video);
			$scope.newVideo = {};
			$scope.showForm = false;
		}

		$scope.deleteVideo = function(index) {
			var id = $scope.videos[index].id;
			Videos.delete({id: id});
			$scope.videos.splice(index, 1);
		}

		// tab logic
		$scope.tab = 1;
		$scope.selectTab = function(tab) {
			$scope.tab = tab;
		}
		$scope.isSelected = function(checkTab) {
			return $scope.tab = checkTab;
		}

	}])
		.controller('videosEditCtrl', ['$scope', '$routeParams', 'VideosEdit', 'VideosCat', function($scope, $routeParams, VideosEdit, VideosCat) {
			$scope.video = VideosEdit.get({id: $routeParams.id});
		}])

})();