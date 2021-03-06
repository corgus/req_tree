# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require moment
#= require bootstrap-datetimepicker
#= require_tree ./vendor
#= require autocomplete
#= require search
#= require quill_input
#= require sortable
#= require_self

$(document).ready ->

  window.QuillInputs = {}

  $('form.autofocus:first *:input[type!=hidden]:first').focus();
  $('.datetime-picker').datetimepicker();

  $(document).on 'click', ->
    $('.close-on-blur').removeClass 'open'
    $('.close-on-blur .hovering').removeClass 'hovering'

  # $(document).on 'click', 'body.test_records.show .autocomplete-container[name*="test_record[test_case_test_records_attributes]"] > .results li:not(.new)', ->
  #   $(@).parents('form').find('input[type="submit"]').click()

  $('.quill').each( (index) ->
    input_name = $(@).data('input-name')
    window.QuillInputs[input_name] = new QuillInput(input_name)
  )
