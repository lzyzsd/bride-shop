"use strict"
angular.module("frontApp", ['directives']).config ($routeProvider) ->
  $routeProvider.when "/",
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  .when '/login',
    templateUrl: 'views/login.html'
    controller: 'LoginCtrl'
  .when '/register',
    templateUrl: 'views/register.html'
    controller: 'RegisterCtrl'
  .otherwise redirectTo: "/"

angular.module('directives', [])