"use strict"
angular.module("frontApp").controller "LoginCtrl", ($scope) ->
  $scope.login = ->
    console.log $scope.user, $scope.user.email, $scope.user.password

  $scope.user =
    email: ''
    password: ''