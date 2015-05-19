require "per_user_status/patches"

module PerUserStatus
  # Registers this gems a Redmine plugin and applies the needed patches
  class RedminePlugin
    include PerUserStatus::Infos

    def initialize
      register!
      boot!
      mirror_assets!
    end

    private

    def register!
      @plugin = Redmine::Plugin.register :per_user_status do
        name NAME
        author AUTHORS.keys.join(", ")
        description DESCRIPTION
        version VERSION
        url URL
        author_url URL
        directory Engine.root
      end
    end

    def boot!
      require "per_user_status/hooks"
      Patches.apply!
    end

    def mirror_assets!
      @plugin.mirror_assets
    end
  end
end
