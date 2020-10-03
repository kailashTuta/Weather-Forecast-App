// MODULE
var weatherApp = angular.module('weatherApp', ['ngRoute', 'ngResource']);


// ROUTES
weatherApp.config(function ($routeProvider) {
    $routeProvider

        .when('/', {
            templateUrl: 'pages/home.html',
            controller: 'homeController'
        })
        .when('/forecast', {
            templateUrl: 'pages/forecast.html',
            controller: 'forecastController'
        });
});

//SERVICES
weatherApp.service('cityService', function () {
    this.city = "New York, NY";
});

// CONTROLLER

weatherApp.controller('homeController', ['$scope', 'cityService', function ($scope, cityService) {
    $scope.city = cityService.city;

    $scope.$watch('city', function () {
        cityService.city = $scope.city;
    });
}]);

weatherApp.controller('forecastController', ['$scope', '$resource', 'cityService', function ($scope, $resource, cityService) {
    $scope.city = cityService.city;
    $scope.weatherAPI = $resource("http://api.weatherapi.com/v1/forecast.json?key=a19e5510d499452094b24114200310", { callback: "JSON_CALLBACK" }, + '&' + { get: { method: "JSONP" } });
    // console.log($scope.weatherAPI);

    $scope.weatherResult = $scope.weatherAPI.get({ q: $scope.city, days: 2 });
    console.log($scope.weatherResult);
}]);