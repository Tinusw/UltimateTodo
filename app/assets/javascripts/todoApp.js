var app = angular.module('todoApp', ['ngResource']);

// csrf token config

// app.config(function($httpProvider) {
//   var authToken;
//   authToken = $("meta[name=\"csrf-token\"]").attr("content");
//   return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
// });