# # from https://gist.github.com/tokenvolt/6599141

# inputs = %w[
#   CollectionSelectInput
#   DateTimeInput
#   FileInput
#   GroupedCollectionSelectInput
#   NumericInput
#   PasswordInput
#   RangeInput
#   StringInput
#   TextInput
# ]

# inputs.each do |input_type|
#   superclass = "SimpleForm::Inputs::#{input_type}".constantize

#   new_class = Class.new(superclass) do
#     def input_html_classes
#       super.push('form-control col-sm-9')
#     end
#   end

#   Object.const_set(input_type, new_class)
# end

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.boolean_style = :nested

  config.wrappers :horizontal, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label, class: 'control-label col-sm-3'

    b.wrapper tag: 'div', class: 'col-sm-9', error_class: 'has-error' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :prepend, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |prepend|
      prepend.use :label , class: 'input-group-addon' ###Please note setting class here for the label does not currently work (let me know if you know a workaround as this is the final hurdle)
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :append, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |prepend|
        prepend.use :input
        prepend.use :label , class: 'input-group-addon' ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :checkbox, tag: 'div', class: "form-group checkbox-group", error_class: "has-error" do |b|
    b.use :html5

    b.use :label, class: 'control-label col-sm-3'\

    b.wrapper tag: 'div', class: 'col-sm-9', error_class: 'has-error' do |ba|
      ba.use :input, class: 'form-control checkbox'
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end

  end

  config.wrappers :vertical, tag: :div, class: 'form-group vertical', error_class: 'has-error' do |b|
    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label, class: 'control-label'
    b.use :input, class: 'form-control'
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com/)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :horizontal

end
