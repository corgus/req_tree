class QuillInput
  constructor: (@input_name) ->
    # console.log("Quillifying #{@input_name}")
    @quill = new Quill(
      ".quill[data-input-name='#{@input_name}'] .editor-container",
      modules:
        'toolbar': container: ".quill[data-input-name='#{@input_name}'] .toolbar-container"
        'link-tooltip': true
        'image-tooltip': true
        'multi-cursor': false
      styles:
        '.ql-editor':
          'font-family': "'Roboto', san-serif"
          'font-size': '14px'
      theme: 'snow'
    )
    @quill['container'] = ".quill[data-input-name='#{@input_name}']"
    @quill['input_name'] = @input_name
    input_div = $("input[name='#{@input_name}']")
    if input_div.length > 0
      @quill.setHTML(input_div.val())
    @quill.on 'text-change', (delta, source) ->
      return if source == 'api'
      input_div.val(@getHTML())
      # $("[name='#{@input_name}']").val @getHTML()
    @

$(document).ready ->
  window.QuillInput = QuillInput
