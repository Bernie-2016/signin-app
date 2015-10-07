angular.module('SteroidsApplication', ['supersonic']).controller 'IndexController', ($scope, supersonic) ->
  $scope.navbarTitle = 'Scan QR Code'

  $scope.scan = ->
    cordova.plugins.barcodeScanner.scan (result) ->
      $.post(
        'https://sanders-api.herokuapp.com/api/v1/signups', signups: [JSON.parse(result.text.replace(/\\"/g, '"'))]
      ).done( -> alert 'Signup accepted!' ).fail ( -> alert 'Error, please try again.' )
    ,
      (error) ->
        alert 'Error, please try again.'
