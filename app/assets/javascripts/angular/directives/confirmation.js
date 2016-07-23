(function() {

	angular.module('ConfirmationDirectives', [])	
		.directive('confirmDelete', [function() {
			return {
				restrict: 'A', 
				link: function(scope, element, attrs) {
					element.bind('click', function() {
						var msg = attrs.confirmDeleteMsg;
						if (msg && confirm(msg)) {
							scope.$apply(attrs.confirmDelete);
						}
					});
				}
			}
		}]);

})();