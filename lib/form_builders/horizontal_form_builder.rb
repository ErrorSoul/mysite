require 'form_builders/horizontal_form/form_helpers'
require 'form_builders/horizontal_form/form_inputs'
require 'form_builders/horizontal_form/form_wrappers'

class HorizontalFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, to: :@template

  include FormBuilders::HorizontalForm::FormHelpers
  include FormBuilders::HorizontalForm::FormInputs
  include FormBuilders::HorizontalForm::FormWrappers

  private

  def prepend_class(_class, options)
    options[:class] = _class | options[:class].try(:split).to_a
  end

  def errors_for(methods)
    methods  = Array(methods).flatten.map(&:to_sym)
    methods |= Array(methods.join('.').to_sym)

    methods.map do |method|
      @object.errors[method].try(:first)
    end.compact.uniq
  end

  def errors_for?(methods)
    methods = Array(methods).flatten.map(&:to_sym)

    methods.map do |method|
      next unless @object.respond_to? method

      has_error = if @object.send(method).respond_to? :errors
                    @object.send(method).errors.any?
      end

      has_error || @object.errors.keys.include?(method)
    end.compact.uniq.any?
  end
end
