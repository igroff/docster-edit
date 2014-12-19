
angular.module("docster-edit", [])
.controller("EditController", ($scope, $q) ->

  deferred = $q.defer()
  navigator.geolocation.getCurrentPosition deferred.resolve,
    deferred.reject,
    enableHighAccuracy: false, timeout: 5000, maximumAge: 6000
  $scope.locationPromise = deferred.promise
  $scope.locationPromise.catch (err) ->
    console.log "error getting location: ", err
  $scope.locationPromise.then (position) ->
    $scope.doc.coords  = position.coords
    
  editor = CKEDITOR.replace( 'editor1', customConfig: '' )

  editor.on 'save', () =>
    $scope.locationPromise.finally () ->
      $scope.doc = $scope.doc || {}
      $scope.doc.command = 'store'
      $scope.doc.type    = 'docster|doc'
      $scope.doc.data    = editor.getData()
      $scope.doc.date    = new Date()
    console.log "I'll save this: ", $scope.doc
    false # prevent the form submission

)
