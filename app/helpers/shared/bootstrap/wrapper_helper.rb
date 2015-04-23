module Shared
  module Bootstrap
    module WrapperHelper

      def btn_group(*args, &block)
        options = {
          type:  'default',
          data:  { toggle:   'dropdown' },
          aria:  { expanded: 'false'    }
        }.deep_merge args.extract_options!

        _class =  %w(btn dropdown-toggle btn-xs)
        _class << "btn-#{options.delete(:type)}"

        prepend_class _class, options

        link =
          link_to '#', options do
            safe_join [I18n.t('actions.actions'), icon_caret]
          end

        content =
          content_tag :ul, class: 'dropdown-menu', role: 'menu' do
            yield block if block_given?
          end

        content_tag :div, class: 'btn-group' do
          safe_join [link, content]
        end
      end

      private

      def prepend_class(_class, options)
        options[:class] = _class | options[:class].try(:split).to_a
      end

    end
  end
end
