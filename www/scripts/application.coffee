angular.module('SteroidsApplication', ['supersonic']).controller 'IndexController', ($scope, supersonic) ->
  $scope.navbarTitle = 'Scan QR Code'

  $scope.scan = ->
    cordova.plugins.barcodeScanner.scan (result) ->
      return if result.text is ''
      info = result.text.replace(/"/g, '').split(',')
      $.post('https://signin-api.berniesanders.com/api/v1/signups', signups: [
        first_name: info[0]
        last_name: info[1]
        phone: info[2]
        email: info[3]
        zip: info[4]
        can_text: info[5]
        extra_fields: info.slice(6).join(',')
      ]
      ).done( -> 
        $('input#scan').animate
          backgroundColor: '#4ACC66'
        , 500
        setTimeout ->
          $('input#scan').val('Success!')
        , 250
        setTimeout ->
          $('input#scan').animate
            backgroundColor: '#FD505E'
          , 500
        , 1500
        setTimeout ->
          $('input#scan').val('Scan Code')
        , 1750
      ).fail ( -> 
        alert 'Error, please try again.' 
      )
    ,
      (error) ->
        alert 'Error, please try again.'
