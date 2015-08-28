$(document).ready ->
  # $('table.sortable')
  #   .sortable(
  #     items: 'tr',
  #     placeholder: '<tr><td colspan="10">&nbsp;</td></tr>',
  #     hoverClass: 'is-hovered'
  #   ).bind('sortstart', (e, ui) ->
  #     # This event is triggered when the user starts sorting and the DOM position has not yet changed.
  #     # ui.item contains the current dragged element
  #     # ui.placeholder contains the placeholder element
  #     # ui.startparent contains the element that the dragged item comes from
  #   ).bind('sortstop', (e, ui) ->
  #     # This event is triggered when the user stops sorting. The DOM position may have changed.
  #     # ui.item contains the element that was dragged.
  #     # ui.startparent contains the element that the dragged item came from.
  #   ).bind('sortupdate', (e, ui) ->
  #     # This event is triggered when the user stopped sorting and the DOM position has changed.
  #     # ui.item contains the current dragged element.
  #     # ui.index contains the new index of the dragged element (considering only list items)
  #     # ui.oldindex contains the old index of the dragged element (considering only list items)
  #     # ui.elementIndex contains the new index of the dragged element (considering all items within sortable)
  #     # ui.oldElementIndex contains the old index of the dragged element (considering all items within sortable)
  #     # ui.startparent contains the element that the dragged item comes from
  #     # ui.endparent contains the element that the dragged item was added to (new parent)
  #   )

  updateSidebarNav = () ->
    window.location.reload()

  window.sortableOldIndex = -1
  $('table.sortable').sortable(
    containerSelector: 'table'
    itemPath: '> tbody'
    itemSelector: 'tr'
    placeholder: '<tr class="placeholder"><td></td><td colspan="10">&nbsp;</td></tr>'

    onDragStart: ($item, container, _super) ->
      window.sortableOldIndex = $item.index()
      _super($item, container)

    onDrop: ($item, container, _super) ->
      newIndex = $item.index()
      if (newIndex != window.sortableOldIndex)
        table = $item.parents('table')
        drop_path = $item.data('drop-path')
        id = $item.data('drop-id')
        if drop_path
          $.ajax(
            method: 'POST'
            url: drop_path
            data: { 'feature[position]': newIndex }
          )
        if table.data('update-sidebar')
          updateSidebarNav()
      window.sortableOldIndex = -1
      _super($item, container)
  )


