require "per_user_status/redmine_plugin"

module PerUserStatus
  # Simple engine to support the Redmine plugin
  class Engine < ::Rails::Engine
    config.to_prepare do
      RedminePlugin.new
    end

    initializer :append_migrations do |app|
      app.config.paths["db/migrate"].concat config.paths["db/migrate"].expanded
    end
  end
end
