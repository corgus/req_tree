$(document).ready ->

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
        drop_id = $item.data('drop-id')
        target_object = table.data('sort-object')
        target_attribute = table.data('sort-attribute')
        if drop_path
          $.ajax(
            method: 'POST'
            url: drop_path
            data: { "#{target_object}[#{target_attribute}]": newIndex, \
                    "#{target_object}[id]": drop_id }
          )
        if table.data('update-sidebar')
          updateSidebarNav()
      window.sortableOldIndex = -1
      _super($item, container)
  )


