saveHandler = () ->
  console.log "save handler called"
  return false

angular.module("docster-edit", [])
  .controller("EditController", ($scope) ->
    $scope.returnFalse = () -> return false
    CKEDITOR.replace( 'editor1', customConfig: '' ).on 'save', saveHandler
    console.log "edit controller instantiated"
  )

