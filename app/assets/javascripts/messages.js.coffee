# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@edit_message = (id, form) -> 
	$("##{id}}.message_body").html(form)

@update_message = (id, message) ->
	$("##{id}}.message_body").html(message)
	
@display_error = (id, errors) ->
	alert errors