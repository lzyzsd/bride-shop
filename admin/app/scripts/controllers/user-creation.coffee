"use strict"
angular.module("adminApp").controller 'UserCreationCtrl', ['$scope', 'UsersFactory', '$location',
  ($scope, UsersFactory, $location) ->

    # callback for ng-click 'createNewUser':
    $scope.createNewUser = ->
      UsersFactory.create($scope.user)
      $location.path('/user-list')
  ]