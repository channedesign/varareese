(function() {

	angular.module('AdminNavController', [])
		.controller('adminNavCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
			$scope.logOut = function() {
				$http.delete('/admins/sign_out').then(function() {
					window.location = "http://www.varareese.com";
				});
			}
			$scope.toIndex = function() {
				$location.url("/");
			}
		}])

})();