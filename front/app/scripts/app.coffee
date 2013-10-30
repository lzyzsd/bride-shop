"use strict"
angular.module("frontApp", ['directives']).config ($routeProvider) ->
  $routeProvider.when("/",
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  ).otherwise redirectTo: "/"

angular.module('directives', [])