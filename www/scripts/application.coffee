angular.module('SteroidsApplication', ['supersonic']).controller 'IndexController', ($scope, supersonic) ->
  $scope.navbarTitle = 'Scan QR Code'

  $scope.scan = ->
    cordova.plugins.barcodeScanner.scan (result) ->
      return if result.text is ''
      info = result.text.replace(/"/g, '').split(',')
      $.post('https://sanders-api.herokuapp.com/api/v1/signups', signups: [
        first_name: info[0]
        last_name: info[1]
        phone: info[2]
        email: info[3]
        zip: info[4]
        canText: info[5]
        event: $('#event-key-input').val()
      ]
      ).done( -> alert 'Signup accepted!' ).fail ( -> alert 'Error, please try again.' )
    ,
      (error) ->
        alert 'Error, please try again.'
