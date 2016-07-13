(function() {

	angular.module('PhotosController', [])
		.controller('photosCtrl', ['$scope', '$http', '$location', 'Photos', 'PhotosCat', function($scope, $http, $location, Photos, PhotosCat) {
			$scope.photos = Photos.query();
			$scope.photosCat = PhotosCat.query();
			$scope.photoCatId = [0];
			$scope.photoCatName;
			$scope.prevSelection;

			// Setup show/hide 
			$scope.showForm = false;
			$scope.showPhotoDZ = false;
			$scope.showCategories = false;
			$scope.showPhotoCatForm = true;
			$scope.showPhotoCatImg = true;
			$scope.showLaterButton = true;

			// DropZone1/photos Upload/ Create
			$scope.dzOptions = {
				url: '/photos',
				maxFilesize: 20,
				paramName: "photo[photo]",
				addRemoveLinks: false, 
				dictDefaultMessage: '<i class="fa fa-plus fa-5x" aria-hidden="true" style="color:black;"></i><h3 style="color:black;">Upload New Photos</h3><p class="small" style="color:black;">(Drag and Drop or Click)</p>',
				headers: {
        	'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
    		}, 
    		queuecomplete: function() {$scope.dzMethods.removeAllFiles();}
			}
			$scope.dzCallbacks = {
				'success' : function(file, xhr) {
					var photoWithCatId = Photos.update({id: xhr.fileID}, {photo_category_id: $scope.photoCatId[0]}).$promise.then(function() {
						var photo = Photos.get({id: xhr.fileID});
						$scope.photos.push(photo);
						$scope.showForm = false;
						$scope.showPhotoDZ = false;
					})
				}
			}
			$scope.dzMethods = {};

			// DropZone2/photoCat Upload/ Update
			$scope.dzOptionsPhotoCat = {
				url: '/photo_categories/',
				init: function() {
			    this.on("processing", function(file) {
			      this.options.url = '/photo_categories/' + $scope.photoCatId[0];
			    });
			  },
			  method: 'PUT',
				maxFilesize: 20,
				maxFiles: 1,
				paramName: "photo_category[image]",
				addRemoveLinks: false, 
				dictDefaultMessage: "Drag and Drop .... or just click anywhere",
				headers: {
        	'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
    		}, 
    		queuecomplete: function() {
    			$scope.dzMethodsPhotoCat.removeAllFiles();
    			$scope.dzMethodsPhotoCatEdit.removeAllFiles();
    			$scope.showPhotoCatForm = true;
    			$scope.showPhotoCatImg = true;
    		}
			}
			$scope.dzCallbacksPhotoCat = {
				'success' : function(data, xhr) {
					angular.forEach($scope.photosCat, function(photoCat) {
						if (photoCat.id === xhr.id) {
							photoCat.image_url = xhr.url;
						}
					})
					$("#photoCatModal").modal("hide");
				}
			}
			$scope.dzMethodsPhotoCatEdit = {};
			$scope.dzMethodsPhotoCat = {};
			
			// Create
			$scope.addNewPhotoCatName = function() {
				$scope.photoCatId = [];
				var photoCat = PhotosCat.save($scope.newPhotoCat).$promise.then(function(data) {
					$scope.photoCatId.push(data.id);
					$scope.photosCat.push(data);
					$scope.newPhotoCat= {};
					$scope.showPhotoCatForm = false;
				}, function(reason) {
					console.log(reason);
				})
			}

			// Edit
			$scope.editPhotoCat = function() {
				$scope.photoCatId = [];
				$scope.showPhotoCatImg = true;
			}
			$scope.toPhotoEdit = function(photoId) {
				$location.url('/photos/'+ photoId +'/edit');
			}

			// Update
			$scope.updatePhotoCatName = function(photoCatId, name) {
				PhotosCat.update({id: photoCatId}, {name: name});
			}
			$scope.updatePhotoCatImg = function(photoCatId) {
				$scope.showPhotoCatImg = false;
				$scope.photoCatId.push(photoCatId);
			}
		

			// Delete
			$scope.deletePhoto = function(photoId, index) {
				Photos.delete({id: photoId});
				$scope.photos.splice(index, 1);
			}
			$scope.deletePhotoCat = function(photoCatId, index) {
				PhotosCat.delete({id: photoCatId}).$promise.then(function() {
					$scope.photosCat.splice(index, 1);
					$scope.photos = Photos.query();
				})
			}


			$scope.selectPhotoCatId = function(photoCat, selected, photosCat) {
				$scope.photoCatId = [];
				$scope.photoCatName = photoCat.name;
				$scope.photoCatId.push(photoCat.id);
				photoCat.checked = true;
				angular.forEach(photosCat, function(photoCat, index) {
					if (selected != index) {
						photoCat.checked = false;
					}
				});
				if (photoCat.checked === true) {
					$scope.showLaterButton = false;
				} 
				// checkbox selection logic
				if (selected === $scope.prevSelection) {
					$scope.showLaterButton = true;
					$scope.prevSelection = undefined;
				} else {
					$scope.prevSelection = selected;
				}
			}

			$scope.createPhotoCatModal = function() {
				$scope.showPhotoDZ = true;
				$scope.photoCatId = [0];
			}

			$scope.cancelForm = function() {
				$scope.showForm = false;
				$scope.showCategories = false;
				$scope.showPhotoDZ = false;
				// anguar.forEach($scope.photosCat, function(photoCat) {
				// 	photoCat.checked = false;
				// })
			}

			$scope.backToForm = function() {
				$scope.showPhotoDZ = false;
				$scope.showForm = true;
			}

			$scope.sortingTabs = {
				cursor: 'move',
				axis: 'x',
				stop: function(e, ui) {
					$.post('/photo_categories/sort.json', $(this).sortable('serialize'));
				}
			}
		
			$scope.sorting = {
				cursor: 'move',
				stop: function(e, ui) {
					$.post('/photos/sort.json', $(this).sortable('serialize'));
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
		.controller('photosEditCtrl', ['$scope', '$http', 'Photos', 'PhotosCat', '$routeParams', '$location', function($scope, $http, Photos, PhotosCat, $routeParams, $location) {
			$scope.photo = Photos.get({id: $routeParams.id});
			// $scope.photo = $http.get('/photos/'+ $routeParams.id +'.json');
			$scope.croppedPhoto = '';
			$scope.photosCat = PhotosCat.query();
			$scope.showCropArea = false;
			$scope.updatePhoto = function() {
				Photos.update($scope.photo).$promise.then(function() {
					$location.url('/photos');
				});
			}

			$scope.updateCrop = function() {
				console.log("yo")
				Photos.update({id: $routeParams.id}, {photo:{photo: $scope.croppedPhoto}});
			}

			$scope.photoEditCancel = function() {
				$location.url('/photos');
			}

		}])

})();