module PerUserStatus
  # Includes an additional input field into the account settings
  # and the user's administration pages
  class Hooks < Redmine::Hook::ViewListener
    # Inject stylesheet tags
    # @param _context [Hash] ignored
    def view_layouts_base_html_head(_context)
      stylesheet_link_tag "per_user_status", plugin: "per_user_status"
    end

    # Inject input field into "My account" form
    # @param context [Hash] hook context
    def view_my_account(context)
      extend_form(context)
    end

    # Inject input field into "Edit user" form
    # @param context [Hash] hook context
    def view_users_form(context)
      extend_form(context)
    end

    private

    def extend_form(context)
      view_context = context[:controller].view_context
      form = context[:form]
      FormExtender.new(view_context, form).to_html
    end

    # @private
    class FormExtender
      attr_reader :view_context, :f

      def initialize(view_context, f)
        @view_context = view_context
        @f = f
      end

      def to_html
        content_tag(:p) do
          input + hint
        end
      end

      private

      def hint
        content_tag :span, class: "hint" do
          l(:per_user_status_form_hint)
        end
      end

      def input
        label = l(:per_user_status_form_custom_status)
        f.text_field :custom_status, label: label
      end

      def content_tag(*args, &block)
        view_context.content_tag(*args, &block)
      end

      def l(*args)
        view_context.l(*args)
      end
    end
  end
end
