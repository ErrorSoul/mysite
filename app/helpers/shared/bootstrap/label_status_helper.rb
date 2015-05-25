module Shared
  module Bootstrap
    module LabelStatusHelper
      LABEL_TYPES = {
        new:      'label label-info',
        check:    'label label-info',
        awaiting: 'label label-primary',
        recheck:  'label label-warning',
        aproved:  'label label-success',
        declined: 'label label-danger'
      }.freeze

      def status_label(status)
        LABEL_TYPES[status.to_sym]
      end

      def status_badge?(value)
        status = value ? 'success' : 'danger'

        content_tag :span, class: "label label-#{status}" do
          value ? I18n.t('_yes') : I18n.t('_no')
        end
      end

      def inn_validation_label(resource)
        if resource.inn_external_validation.try(:approved)
          status_label :aproved
        else
          status_label :declined
        end
      end

      def passport_terrorist_label(resource)
        pass_valid = resource.passport.terrorist_external_validation
        if pass_valid.try(:approved)
          status_label :aproved
        else
          status_label(pass_valid.message.nil? ? :declined : :recheck)
        end
      end

      def passport_lost_label(resource)
        pass_valid = resource.passport.lost_passport_external_validation
        if pass_valid.try(:approved)
          status_label :aproved
        else
          status_label(pass_valid.message.nil? ? :declined : :recheck)
        end
      end

      def arr_for_options(states)
        states.map do |state|
          [t("agent_state.#{state}"), state.to_s]
        end
      end

      def admin_states
        arr = [:none, :awaiting, :recheck, :check, :aproved, :declined]
        arr_for_options(arr)
      end

      def arr_for_another_opt(arr)
        arr.map do |val|
          val
        end
      end
    end
  end
end
