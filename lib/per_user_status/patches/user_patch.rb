module PerUserStatus
  module Patches
    # Patches the User#name method to allow injecting the
    # current user status
    module UserPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :name, :per_user_status
        safe_attributes :custom_status
      end

      def name_with_per_user_status(formatter = nil)
        default = name_without_per_user_status(formatter)
        if custom_status.present?
          "#{default} (#{custom_status})"
        else
          default
        end
      end
    end
  end
end
