module FormBuilders
  module HorizontalForm
    module FormInputs

      FIELDS = %w(
        email_field
        password_field
        text_field
        phone_field
        number_field
      ).freeze

      FIELDS.each do |method|
        define_method method do |field, options = {}|
          prepend_class %w(form-control), options
          super field, options
        end
      end

      def select(method, choices = nil, options = {}, html_options = {}, &block)
        prepend_class %w(form-control), html_options
        super method, choices, options, html_options, &block
      end

      def file_field(field, options = {})
        prepend_class %w(form-control-static), options
        super field, options
      end

    end
  end
end
