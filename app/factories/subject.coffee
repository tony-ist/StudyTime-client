angular.module('app.services')
.factory "Subject", [
    '$q'
    '$http'
    'localStorageService'
    'config'
    '$timeout'
    'Cachier'

    ($q, $http, localeStorage, config, $timeout, Cachier) ->
      upload_done: (subject_id, event_id, professor_id, link, name, descr, type, s3)->
        ""

      sign_upload: (subject_id)->
        deferred = $q.defer()
        $timeout(->
          $http(
            method: 'POST'
            url: "#{config.apiUrl}/subject/#{subject_id}/attachment/sign"
          )
          .success (data)->
              # Send data to user
              if data.length == 0
                deferred.reject false
              else
                deferred.resolve data
          .error (data) ->
            deferred.reject false
        )
        deferred.promise
  ]