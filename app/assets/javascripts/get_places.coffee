@getPlaces = ->
    failure = ->
        alert 'problema getting location'
    $('get_location').each (index) ->
        $('this').on 'click', (event) ->
            if navigator.geolocation
                navigator.geolocation.getCurrentPosition ((position) ->
                    $.ajax
                        type: 'PUT'
                        url: '/places/get_locations' + '?latitude=' + position.coords.latitude + '&longitude=' + position.coords.longitude), failure,
                        enableHighAccuracy: true
                        timeout: 5000
            event.preventDefault()
$(document).on('turbolinks:load', @getPlaces)

@createPlace = ->
    $('.location_results_list button').on 'click', (event) ->
        data = JSON.parse(JSON.stringify($(this).data('attributes')))
        $.ajax '/places',
            type: 'POST'
            dataType: 'script'
            data: {
                place: {
                    name: data['name']
                    address: data['vicinity']

                }
            }
            success: (data, status) ->
                console.log 'Data: ' + data + '\nStatus: ' + status

        event.preventDefault()