// CONTROLLER
weatherApp.controller("homeController", [
  "$scope",
  "$location",
  "cityService",
  function ($scope, $location, cityService) {
    $scope.city = cityService.city;

    $scope.$watch("city", function () {
      cityService.city = $scope.city;
    });

    $scope.submit = function () {
      $location.path("/forecast");
    };
  },
]);

weatherApp.controller("forecastController", [
  "$scope",
  "$resource",
  "$routeParams",
  "cityService",
  function ($scope, $resource, $routeParams, cityService) {
    $scope.city = cityService.city;
    $scope.days = $routeParams.days || 2;
    $scope.weatherAPI = $resource(
      "https://api.weatherapi.com/v1/forecast.json?key=a19e5510d499452094b24114200310",
      { callback: "JSON_CALLBACK" },
      +"&" + { get: { method: "JSONP" } }
    );
    // console.log($scope.weatherAPI);

    $scope.weatherResult = $scope.weatherAPI.get({
      q: $scope.city,
      days: $scope.days,
    });
    // console.log($scope.weatherResult);
  },
]);
