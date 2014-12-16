saveHandler = () ->
  console.log "save handler called"
  false

angular.module("docster-edit", [])
  .controller("EditController", ($scope) ->
    CKEDITOR.replace( 'editor1', customConfig: '' ).on 'save', saveHandler
  )

