services = angular.module 'adminApp.services'

services.factory 'UsersFactory', ($resource) ->
  $resource('/ngdemo/web/users', {},
    query: { method: 'GET', isArray: true }
    create: { method: 'POST' }
  )