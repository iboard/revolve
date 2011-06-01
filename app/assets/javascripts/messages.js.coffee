# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@new_message = (form) ->
  $("#page_action_links").after( "<div id='new_message'><h1>New Message</h1>"+form+"</div>")


@edit_message = (id, form) ->
  $("##{id}}.message_body").html(form)

@update_message = (message, errors, html) ->
  unless errors == null
    $("#errors_" + message.id ).remove()
    msg = "<div class='errors' id='errors_#{message.id}'>"
    error_messages = for field, error of errors
      msg += field + ": " + error + "<br/>"
    msg += "</div>"
    $("#edit_message_"+ message.id + " .actions").before( msg )
  else
    $("#"+ message.id + ".message_body").html(html)

@display_error = (id, errors) ->
  alert errors

#	if hash['errors'].any?
#    alert hash['errors'].to_s
#  else
#    $("##{hash[:id]}}.message_body").html(message)