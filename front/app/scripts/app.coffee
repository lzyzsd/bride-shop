"use strict"
angular.module("frontApp", ['directives']).config ($routeProvider) ->
  $routeProvider.when "/",
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  .when '/login',
    templateUrl: 'views/login.html'
    controller: 'LoginCtrl'
  .otherwise redirectTo: "/"

angular.module('directives', [])