require 'form_builders/horizontal_form_builder'

module Shared
  module Bootstrap
    module Forms
      module HorizontalFormHelper

        def horizontal_form_for(resource, options = {}, &block)
          form_for resource, form_options(options), &block
        end

        private

        def form_options(options)
          options = {
            builder: HorizontalFormBuilder
          }.merge options

          prepend_form_class options

          options
        end

        def prepend_form_class(options)
          options[:html] ||= {}

          options[:html][:class] = %w(form-horizontal) | \
            options[:html].try(:[], :class).try(:split).to_a
        end

      end
    end
  end
end
