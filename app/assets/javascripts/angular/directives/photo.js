(function() {

	angular.module('PhotosDirectives', [])
		.directive('photoTabContent', function() {
			return {
				restrict: 'E',
				templateUrl: 'partials/photo_tab_content.html'
			}
		})
		.directive('checkUniqueness', ['PhotosCat', function(PhotosCat) {
			return {
				require: 'ngModel', 
				link: function(scope, element, attrs, ngModel) {
					var seedData = PhotosCat.query();
					scope.notUniq = false;
					valid(true);
					ngModel.$parsers.push(function(value) {
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
						return value;
					});
					function valid(bool) {
          	ngModel.$setValidity('record-taken', bool);
        	};
        	scope.interacted = function(field) {
		      	return scope.submitted || field.$dirty;
		    	};
				}
			}
		}])
})();
