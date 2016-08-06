(function() {

	angular.module('VideosDirectives', [])
		.directive('videoForm', function() {
			return {
				restrict: 'E',
				templateUrl: 'partials/video_form.html',
				scope: {value: '=', videosCat: '=', form: '='},
				link: ['scope', function(scope) {
					scope.interacted = function(field) {
			    	return scope.submitted || field.$dirty;
			  	};
				}]
			}
		})
		.directive('videoTabContent', function() {
			return {
				restrict: 'E',
				templateUrl: 'partials/video_tab_content.html'
			}
		})
		.directive('checkUniqueness', ['VideosCat', 'Videos', function(VideosCat, Videos) {
			return {
				require: 'ngModel', 
				link: ['scope', 'element', 'attrs', 'ngModel', function(scope, element, attrs, ngModel) {
					var seedData = VideosCat.query();
					var seedDataVideo = Videos.query();
					scope.notUniq = false;
					valid(true);
					ngModel.$parsers.push(function(value) {
						if (attrs.ngModel === 'newVideoCat.name') {
							for(var i=0; i <= seedData.length-1; i++) {
								if (value === seedData[i].name) {
									console.log(value + " is taken")
									scope.notUniq = true;
									valid(false);
									break;
								} else {
									valid(true);
									scope.notUniq = false;
									console.log(value + " is not taken")
								}
							}
						}
						if (attrs.ngModel === 'value.link') {
							for(var i=0; i <= seedDataVideo.length-1; i++) {
								if (value === seedDataVideo[i].link) {
									console.log(value + " is taken")
									scope.notUniq = true;
									valid(false);
									break;
								} else {
									valid(true);
									scope.notUniq = false;
									console.log(value + " is not taken")
								}
							}
						}
						return value;
					});
					function valid(bool) {
          	ngModel.$setValidity('record-taken', bool);
        	};
        	scope.interacted = function(field) {
		      	return scope.submitted || field.$dirty;
		    	};
				}]
			}
		}])
})();