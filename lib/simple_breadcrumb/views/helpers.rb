module SimpleBreadcrumb
  module Views
    module Helpers
      extend ActiveSupport::Concern

      included do
        SimpleBreadcrumb.formatter = SimpleBreadcrumb::Formatter.new        
      end

      def render_breadcrumbs(options = {})
        SimpleBreadcrumb.formatter.render(@container)
      end

      def initialize_formatter
        SimpleBreadcrumb.formatter = SimpleBreadcrumb::Formatter.new                
      end     

      private




    end
  end
end