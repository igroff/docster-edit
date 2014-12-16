
angular.module("docster-edit", [])
.controller("EditController", ($scope, $q) ->

  deferred = $q.defer()
  navigator.geolocation.getCurrentPosition deferred.resolve,
    deferred.reject,
    enableHighAccuracy: false, timeout: 5000, maximumAge: 6000
  $scope.locationPromise = deferred.promise
    
  editor = CKEDITOR.replace( 'editor1', customConfig: '' )

  editor.on 'save', () =>
    $scope.locationPromise.then (position) ->
      doc =
        command: 'store'
        type: 'docster|doc'
        data: editor.getData()
        coords: position.coords
        date: new Date()
    $scope.locationPromise.catch (err) ->
      console.log "uh oh: ", err
    false # prevent the form submission

)
