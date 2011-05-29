# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@edit_message = (id, form) ->
  $("##{id}}.message_body").html(form)

@update_message = (message, errors, html) ->
  unless errors == null
    $("#"+ message.id + ".message_body").before( errors )
  else
    $("#"+ message.id + ".message_body").html(html)

@display_error = (id, errors) ->
  alert errors

#	if hash['errors'].any?
#    alert hash['errors'].to_s
#  else
#    $("##{hash[:id]}}.message_body").html(message)