(function() {

	var videosController = angular.module('VideosController', []);

	videosController.controller('videosCtrl', ['$scope', 'Videos', 'VideosCat', function($scope, Videos, VideosCat) {
		$scope.videos = Videos.query();
		$scope.videosCat = VideosCat.query();
		$scope.videoCatId = [0];

		// Setup show/hide 
		$scope.showForm = false;
		$scope.showVideoCatForm = true;
		$scope.showVideoCatImg = true;

		// DropZone2/videoCat Upload/ Update
		$scope.dzOptionsVideoCat = {
			url: '/video_categories/',
			init: function() {
		    this.on("processing", function(file) {
		      this.options.url = '/video_categories/' + $scope.videoCatId[0];
		    });
		  },
		  method: 'PUT',
			maxFilesize: 20,
			maxFiles: 1,
			paramName: "video_category[image]",
			addRemoveLinks: false, 
			dictDefaultMessage: "Drag and Drop .... or just click anywhere",
			headers: {
      	'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
  		}, 
  		queuecomplete: function() {
  			$scope.dzMethodsVideoCat.removeAllFiles();
  			$scope.dzMethodsVideoCatEdit.removeAllFiles();
  			$scope.showVideoCatForm = true;
  			$scope.showVideoCatImg = true;
  		}
		}
		$scope.dzCallbacksVideoCat = {
			'success' : function(data, xhr) {
				// $scope.photoCatImg = PhotosCat.get({id: xhr.id, edit: 'edit'});
				angular.forEach($scope.videosCat, function(videoCat) {
					if (videoCat.id === xhr.id) {
						videoCat.image_url = xhr.url;
					}
				})
				// $scope.photoCatId = [];
				$("#videoCatModal").modal("hide");
			}
		}
		$scope.dzMethodsVideoCatEdit = {};
		$scope.dzMethodsVideoCat = {};


		// Create
		$scope.addVideo = function() {
			var video = Videos.save($scope.newVideo);
			$scope.videos.push(video);
			$scope.newVideo = {};
			$scope.showForm = false;
		}
		$scope.addNewVideoCatName = function() {
			$scope.videoCatId = [];
			var videoCat = VideosCat.save($scope.newVideoCat).$promise.then(function(data) {
				$scope.videoCatId.push(data.id);
				$scope.videosCat.push(data);
				$scope.newVideoCat= {};
				$scope.showVideoCatForm = false;
			}, function(reason) {
				alert("Name already taken");
			})
		}

		// Edit
		$scope.editVideoCat = function() {
			$scope.videoCatId = [];
			$scope.showVideoCatImg = true;
		}

		// Update
		$scope.updateVideoCatImg = function(videoCatId) {
			$scope.showVideoCatImg = false;
			$scope.videoCatId.push(videoCatId);
		}


		// Delete
		$scope.deleteVideo = function(index) {
			var id = $scope.videos[index].id;
			Videos.delete({id: id});
			$scope.videos.splice(index, 1);
		}
		$scope.deleteVideoCat = function(videoCatId, index) {
			VideosCat.delete({id: videoCatId});
			$scope.videosCat.splice(index, 1);
		}


		$scope.cancelAddVideo = function() {
			$scope.newVideo = {};
			$scope.showForm = false;
		}

		$scope.updateSelection = function(selected, videosCat) {
			angular.forEach(videosCat, function(videoCat, index) {
				if (selected != index) {
					videoCat.checked = false;
				}
			});
		}

		$scope.sortingTabs = {
			cursor: 'move',
			axis: 'x',
			stop: function(e, ui) {
				$.post('/video_categories/sort.json', $(this).sortable('serialize'));
			}
		}

		$scope.sorting = {
			cursor: 'move',
			stop: function(e, ui) {
				$.post('/videos/sort.json', $(this).sortable('serialize'));
			}
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
		.controller('videosEditCtrl', ['$scope', '$routeParams', '$location', 'VideosCat', 'Videos', function($scope, $routeParams, $location, VideosCat, Videos) {
			$scope.video = Videos.get({id: $routeParams.id, edit: 'edit'});
			$scope.videosCat = VideosCat.query();

			$scope.updateVideo = function() {
				Videos.update($scope.video).$promise.then(function() {
					$location.url('/videos');
				});
			}

			$scope.videoEditCancel = function() {
				$location.url('/videos');
			}

		}])


})();