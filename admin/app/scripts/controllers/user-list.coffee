"use strict"
angular.module("adminApp").controller 'UserListCtrl', ['$scope', 'UsersFactory', 'UserFactory', '$location',
    ($scope, UsersFactory, UserFactory, $location) ->
      # callback for ng-click 'editUser':
      $scope.editUser = (userId) ->
        $location.path('/user-detail/' + userId)

      # callback for ng-click 'deleteUser':
      $scope.deleteUser = (userId) ->
        UserFactory.delete({ id: userId })
        $scope.users = UsersFactory.query()

      # callback for ng-click 'createUser':
      $scope.createNewUser = ->
        $location.path('/user-creation')

      # $scope.users = UsersFactory.query()
      $scope.users = [
        firstName: 'user1'
        lastName: 'lee'
      ,
        firstName: 'user2'
        lastName: 'lee'
      ]
    ]