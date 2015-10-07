angular.module('SteroidsApplication', ['supersonic']).controller 'IndexController', ($scope, supersonic) ->
  $scope.navbarTitle = 'Scan QR Code'

  $scope.scan = ->
    cordova.plugins.barcodeScanner.scan (result) ->
      alert "Got #{result.text}"
    ,
      (error) ->
        alert "Scanning failed: #{error}"
