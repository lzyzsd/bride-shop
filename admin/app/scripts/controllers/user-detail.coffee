"use strict"
angular.module("adminApp").controller 'UserDetailCtrl', ['$scope', '$routeParams', 'UserFactory', '$location',
    ($scope, $routeParams, UserFactory, $location) ->

      # callback for ng-click 'updateUser':
      $scope.updateUser = ->
        UserFactory.update($scope.user)
        $location.path('/user-list')

      # callback for ng-click 'cancel':
      $scope.cancel = ->
        $location.path('/user-list')

      $scope.user = UserFactory.show({id: $routeParams.id})
    ]