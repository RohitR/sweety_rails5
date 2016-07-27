App.blood_glucose = App.cable.subscriptions.create "BloodGlucoseChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#reading').append data['reading']
    # Called when there's incoming data on the websocket for this channel

  enter_reading: (reading,date) ->
    $('#error_explanation').remove();
    @perform 'enter_reading', {reading: reading,date: date}

  delete_reading: (reading_id) ->
    $('#error_explanation').remove();
    @perform 'delete_reading', id: reading_id



$(document).on 'keypress', '[data-behavior~=glucose_reader]', (event) ->
  if event.keyCode is 13 # return = send
    App.blood_glucose.enter_reading event.target.value,$('#read_date').val()
    event.target.value = ""
    event.preventDefault()
$(document).on 'click', '.delete_reading', (event) ->
  reading_id=($(this).prop('id'))
  ($(this).parent().hide())
  App.blood_glucose.delete_reading reading_id
  event.target.value = ""
  event.preventDefault()
