module Shared
  module Bootstrap
    module BootstrapFormHelper

      include Shared::Bootstrap::Forms::HorizontalFormHelper

      def bootstrap_form_for(resource, options = {}, &block)
        options = { type: 'horizontal' }.merge options

        case options.delete(:type)
        when 'horizontal'
          horizontal_form_for resource, options, &block
        end
      end

    end
  end
end
