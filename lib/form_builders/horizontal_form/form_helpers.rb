module FormBuilders
  module HorizontalForm
    module FormHelpers
      def hint(methods, hint = nil)
        (Array(hint) | errors_for(methods)).compact.map do |message|
          content_tag :p, message, class: 'help-block'
        end.join.html_safe
      end

      def label(method, content_or_options = {}, options = {}, &block)
        prepend_class %w(control-label), options
        super method, content_or_options, options, &block
      end
    end
  end
end
