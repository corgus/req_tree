

$(document).ready ->
  $(document).on 'input', '.search-container > input', ->
    results = $(@).siblings('.results')
    $.ajax(
      url: $(@).data('source-path')
      data:
        query: $(@).val()
        new: $(@).data('new-params')
    ).done (response) ->
      results.html(response).addClass 'open'

  # Key press: Up/Down hovers item, Enter selects it
  $(document).on 'keydown', '.search-container > input', (e) ->
    input_name = $(@).parent().attr('name')
    $("input[name='#{input_name}']").val ''
    return unless e.which in [38, 40, 13]
    e.preventDefault()
    options = $(@).parents('.search-container').find('.results li')
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

  $(document).on 'click', '.search-container:not(.redirect) > .results li:not(.redirect)', ->
    $(@).closest('.search-container').find('input').val $(this).data('display')
    input_name = $(@).closest('.search-container').attr('name')
    $("input[name='#{input_name}']").val $(@).data('id')

  $(document).on 'click', '.search-container > .results li.redirect', (e) ->
    document.location = $(@).data('select-path')

  $(document).on 'click', '.search-container.redirect > .results li', (e) ->
    document.location = $(@).data('select-path')

  $(document).on 'mouseenter', '.search-container > .results li', ->
    $(@).siblings('li').removeClass('hovering')
    $(@).addClass('hovering')

  $(document).on 'mouseleave', '.search-container > .results li', ->
    $(@).removeClass('hovering')

  # Trigger form submit on select
  $(document).on 'click', '.search-container.submit-on-select > .results li:not(.redirect)', ->
    $(@).parents('form').find('input[type="submit"]').click()
