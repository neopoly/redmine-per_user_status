require "per_user_status/patches/user_patch"

module PerUserStatus
  # This module holds all patches of a default Redmine application
  module Patches
    # Apply all patches
    def self.apply!
      apply_to(::User, UserPatch)
    end

    private

    def self.apply_to(target, mod)
      target.send(:include, mod)
    end
  end
end
