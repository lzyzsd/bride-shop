"use strict"
angular.module("adminApp").controller "LoginCtrl", ($scope) ->
  $scope.user = {}

  $scope.login = (user) ->
    console.log "name: #{user.username} password: #{user.password}"