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
        filename =
          content_tag :div, class: 'form-control' do
            [ content_tag(:i, '', class: 'glyphicon glyphicon-file fileinput-exists'),
              content_tag(:span, '', class: 'fileinput-filename')
            ].join.html_safe
          end

        fileinput =
          content_tag :span, class: 'input-group-addon btn btn-default btn-file' do
            [ content_tag(:span, I18n.t('files'), class: 'fileinput-new'),
              content_tag(:span, I18n.t('actions.change'), class: 'fileinput-exists'),
              super(field, options)
            ].join.html_safe
          end

        content = [filename, fileinput].join.html_safe

        content_tag :div, content, class: 'fileinput fileinput-new input-group'
      end

    end
  end
end
