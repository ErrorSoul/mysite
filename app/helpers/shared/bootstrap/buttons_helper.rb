module Shared
  module Bootstrap
    module ButtonsHelper
      BTNS = [
        { action: 'back',     icon: 'arrow_left', class: 'btn-default' },
        { action: 'cancel',   icon: 'arrow_left', class: 'btn-default' },
        { action: 'create',   icon: 'plus',       class: 'btn-success' },
        { action: 'add',      icon: 'plus',       class: 'btn-success' },
        { action: 'dwload',   icon: 'send',       class: 'btn-success' },
        { action: 'edit',     icon: 'edit',       class: 'btn-warning' },
        { action: 'check',    icon: 'edit',       class: 'btn-warning' },
        { action: 'send',     icon: 'send',       class: 'btn-default' },
        { action: 'delete',   icon: 'trash',      class: 'btn-danger'  },
        { action: 'continue', icon: 'ok',         class: 'btn-success' },
        { action: 'period',   icon: 'send',       class: 'btn-success js-submit' },
        { action: 'save',     icon: 'ok',         class: 'btn-success js-submit' },
        { action: 'write',    icon: 'ok',         class: 'btn-primary js-submit' },
        { action: 'find',     icon: 'search',     class: 'btn-primary js-submit' },
        { action: 'review',   icon: 'search',     class: 'btn-primary' },

        #
        # Print, Files
        #
        { action: 'print',    icon: 'print',      class: 'btn-default' },
        { action: 'pdf',      icon: 'file',       class: 'btn-default' },
        { action: 'docx',     icon: 'file',       class: 'btn-default' },
        { action: 'odt',      icon: 'file',       class: 'btn-default' }
      ].freeze

      SIZES = %w(xs sm)

      #
      # Code below define methods in two sizes:
      #
      #   xs - extra-small
      #   sm - small
      #
      # Methods example:
      #
      #   btn_sm_to_back   path, options = {}
      #   btn_sm_to_cancel path, options = {}
      #   btn_sm_to_create path, options = {}
      #
      #   btn_xs_to_back   path, options = {}
      #   btn_xs_to_cancel path, options = {}
      #   btn_xs_to_create path, options = {}
      #
      # By default save button will send closest form, you can pass through options
      # which form should be send:
      #
      #   data: { form: 'form-id-or-class' }
      #
      BTNS.each do |args|
        SIZES.each do |size|
          define_method "btn_#{size}_to_#{args[:action]}" do |path, options = {}|
            _class = ['btn', "btn-#{size}"] | args[:class].split

            options[:class] = (options[:class].try(:split).to_a | _class).join(' ')
            options[:method] = :delete if args[:action] == 'delete'
            options[:t] ||= t(args[:action], scope: :actions)

            link_to path, options do
              safe_join [send("icon_#{args[:icon]}"), options[:t]]
            end
          end
        end
      end

      #
      # Code below define clean links
      #
      # Methods example:
      #
      #   btn_to_back   path, options = {}
      #   btn_to_cancel path, options = {}
      #   btn_to_create path, options = {}
      #
      BTNS.each do |args|
        define_method "btn_to_#{args[:action]}" do |path, options = {}|
          options[:method] = :delete if args[:action] == 'delete'
          options[:t] ||= t(args[:action], scope: :actions)

          link_to path, options do
            safe_join [send("icon_#{args[:icon]}"), options[:t]]
          end
        end
      end

      def btn_xs_popover(*args)
        args = args.extract_options!

        options = {
          type: 'button',
          class: 'btn btn-xs btn-info',
          data: {
            toggle: 'popover', placement: 'top', container: 'body'
          }
        }

        options[:class] = (
          options[:class].try(:split).to_a | args[:class].split
        ).join(' ')

        options[:data][:content] = args[:tip]

        button_tag args[:content] || t(:reference), options
      end
    end
  end
end
