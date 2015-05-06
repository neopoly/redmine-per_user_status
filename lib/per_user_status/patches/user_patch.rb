module PerUserStatus
  module Patches
    # Patches the User#name method to allow injecting the
    # current user status
    module UserPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :name, :custom_status
        safe_attributes :custom_status
      end

      # Appends the custom user status to the base user name
      # @param formatter The formatter to use for the name
      # @see User#name
      def name_with_custom_status(formatter = nil)
        default = name_without_custom_status(formatter)
        if custom_status.present?
          "#{default} (#{custom_status})"
        else
          default
        end
      end
    end
  end
end
