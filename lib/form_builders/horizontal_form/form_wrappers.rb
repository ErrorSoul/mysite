module FormBuilders
  module HorizontalForm
    module FormWrappers

      def group(*args, &block)
        options = args.extract_options!
        methods = args

        options = { full: true }.merge options

        _class = []
        _class << 'form-group' if options[:full]
        _class << 'has-error'  if errors_for?(methods)

        prepend_class _class, options

        content_tag :div, class: options[:class].join(' ') do
          yield block if block_given?
        end
      end

      def panel(*args, &block)
        options = args.extract_options!
        methods = args

        _class = ['panel']
        _class <<
          if errors_for?(methods)
            'panel-danger'
          elsif options[:type].present?
            'panel-' + options.delete(:type)
          else
            'panel-default'
          end

        prepend_class _class, options

        head =
          content_tag :div, class: 'panel-heading' do
            content_tag :h4, options[:title], class: 'panel-title'
          end

        body =
          content_tag :div, class: 'panel-body' do
            yield block if block_given?
          end

        content_tag :div, class: options[:class], id: options[:id] do
          [head, body].join.html_safe
        end
      end

    end
  end
end
