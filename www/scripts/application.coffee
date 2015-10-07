angular.module('SteroidsApplication', [
  'supersonic'
])
.controller 'IndexController', ($scope, supersonic) ->

  $scope.navbarTitle = "Welcome to Supersonic!"
