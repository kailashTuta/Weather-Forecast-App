// CONTROLLERS
// Using APP_CONFIG from config.js for centralized configuration

weatherApp.controller("homeController", [
  "$scope",
  "$location",
  "cityService",
  function ($scope, $location, cityService) {
    $scope.city = cityService.city;
    $scope.error = null;

    $scope.$watch("city", function () {
      cityService.city = $scope.city;
    });

    $scope.submit = function () {
      // Validate city input
      if (!$scope.city || !$scope.city.trim()) {
        $scope.error = "Please enter a city name";
        return;
      }
      $scope.error = null;
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
    $scope.days = parseInt($routeParams.days) || APP_CONFIG.DEFAULT_FORECAST_DAYS;
    $scope.error = null;
    $scope.loading = true;

    // Validate city input
    if (!$scope.city || !$scope.city.trim()) {
      $scope.error = "Please enter a city name";
      $scope.loading = false;
      return;
    }

    $scope.weatherAPI = $resource(
      APP_CONFIG.WEATHER_API_BASE_URL + "/forecast.json",
      { callback: "JSON_CALLBACK" },
      { get: { method: "JSONP" } }
    );

    $scope.weatherResult = $scope.weatherAPI.get({
      key: APP_CONFIG.WEATHER_API_KEY,
      q: $scope.city,
      days: $scope.days,
    }, function(success) {
      // Success callback
      $scope.loading = false;
    }, function(error) {
      // Error callback
      $scope.loading = false;
      $scope.error = "Failed to fetch weather data. Please check the city name and try again.";
      console.error("Weather API Error:", error);
    });
  },
]);
