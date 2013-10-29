"use strict"
angular.module("adminApp", ["adminApp.services"]).config ($routeProvider) ->
  $routeProvider.when('/user-list', {templateUrl: 'views/user-list.html', controller: 'UserListCtrl'})
  $routeProvider.when('/user-detail/:id', {templateUrl: 'views/user-detail.html', controller: 'UserDetailCtrl'})
  $routeProvider.when('/user-creation', {templateUrl: 'views/user-creation.html', controller: 'UserCreationCtrl'})
  $routeProvider.otherwise({redirectTo: '/user-list'})

angular.module('adminApp').controller 'AppCtrl', ['$scope', ($scope) ->
  $scope.$on '$routeChangeError', (event, current, previous, rejection) ->
]

angular.module('adminApp').controller 'HeaderCtrl', ['$scope', '$location', '$route',
  ($scope, $location, $route) ->
]