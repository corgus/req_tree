

$(document).ready ->
  $(document).on 'input', '.autocomplete-container > input', ->
    results = $(@).siblings('.results')
    $.ajax(
      url: $(@).data('source-path')
      data:
        query: $(@).val()
        new: $(@).data('new-params')
    ).done (response) ->
      results.html(response).addClass 'open'

  # Key press: Up/Down hovers item, Enter selects it
  $(document).on 'keydown', '.autocomplete-container > input', (e) ->
    input_name = $(@).parent().attr('name')
    $("input[name='#{input_name}']").val ''
    return unless e.which in [38, 40, 13]
    e.preventDefault()
    options = $(@).parents('.autocomplete-container').find('.results li')
    current_hover = $(options).filter('.hovering')

    if e.which in [13, 9] # enter / tab
      if current_hover.length > 0
        current_hover.click()
      else
        $(options[0]).click()
    else if current_hover.length == 0
      $(options[0]).addClass('hovering')
    else if e.which == 38 # up
      prev = current_hover.prev('li')
      if prev.length > 0
        current_hover.removeClass('hovering')
        prev.addClass('hovering')
    else if e.which == 40 # down
      next = current_hover.next('li')
      if next.length > 0
        current_hover.removeClass('hovering')
        next.addClass('hovering')

  $(document).on 'click', '.autocomplete-container > .results li:not(.new)', ->
    $(@).closest('.autocomplete-container').find('input').val $(this).data('display')
    input_name = $(@).closest('.autocomplete-container').attr('name')
    $("input[name='#{input_name}']").val $(@).data('id')

  $(document).on 'click', '.autocomplete-container > .results li.new', (e) ->
    document.location = $(@).data('select-path')

  $(document).on 'click', '.autocomplete-container > .results li.redirect', (e) ->
    document.location = $(@).data('select-path')

  $(document).on 'mouseenter', '.autocomplete-container > .results li', ->
    $(@).siblings('li').removeClass('hovering')
    $(@).addClass('hovering')

  $(document).on 'mouseleave', '.autocomplete-container > .results li', ->
    $(@).removeClass('hovering')

  # Trigger form submit on select
  $(document).on 'click', '.autocomplete-container.submit-on-select > .results li:not(.new)', ->
    $(@).parents('form').find('input[type="submit"]').click()
