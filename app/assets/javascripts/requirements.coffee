# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document).on 'click', 'body.requirements.show .autocomplete-container[name*="requirement[feature_requirements_attributes]"] > .results li:not(.new)', ->
    $(@).parents('form').find('input[type="submit"]').click()
