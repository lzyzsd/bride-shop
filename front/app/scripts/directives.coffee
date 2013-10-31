'use strict'
angular.module('directives')
  .directive 'topMenu', ->
    restrict: 'E'
    controller: 'TopMenuCtrl'
    templateUrl: 'views/top_menu.html'

  .directive 'categoryList', ->
    restrict: 'E'
    controller: 'CategoryListCtrl'
    templateUrl: 'views/category_list.html'