module PerUserStatus
  # Registers this gems a Redmine plugin and applies the needed patches
  class RedminePlugin
    include PerUserStatus::Infos

    def initialize
      register!
      boot!
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
      # nothing yet
    end
  end
end
