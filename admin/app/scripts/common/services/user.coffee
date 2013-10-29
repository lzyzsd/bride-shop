services = angular.module('adminApp.services', ['ngResource'])

services.factory 'UserFactory', ($resource) ->
  $resource('/ngdemo/web/users/:id', {},
    show: { method: 'GET' }
    update: { method: 'PUT', params: {id: '@id'} }
    delete: { method: 'DELETE', params: {id: '@id'} }
  )