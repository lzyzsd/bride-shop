'use strict'
angular.module('directives')
  .directive 'topMenu', ->
    restrict: 'E'
    controller: 'TopMenuCtrl'
    templateUrl: 'views/top_menu.html'