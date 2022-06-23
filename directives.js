// DIRECTIVES
weatherApp.directive("weatherForecast", function () {
  return {
    restrict: "E",
    templateUrl: "directives/weatherForecast.html",
    replace: true,
  };
});
weatherApp.directive("weatherReport", function () {
  return {
    restrict: "E",
    templateUrl: "directives/weatherReport.html",
    replace: true,
  };
});
