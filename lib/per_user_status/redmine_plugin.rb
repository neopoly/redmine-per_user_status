require "per_user_status/patches"

module PerUserStatus
  # Registers this gems a Redmine plugin and applies the needed patches
  class RedminePlugin
    include PerUserStatus::Infos

    def initialize
      register!
      patch_migration_directory!
      boot!
    end

    def self.migration_directory
      File.expand_path("../../../db/migrate", __FILE__)
    end

    private

    def register!
      @plugin = Redmine::Plugin.register :user_wiki_macro do
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

    def patch_migration_directory!
      @plugin.instance_eval do
        def migration_directory
          ::PerUserStatus::RedminePlugin.migration_directory
        end
      end
    end
  end
end
