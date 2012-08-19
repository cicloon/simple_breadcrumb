module SimpleBreadcrumb
	module Controllers
		module Helpers
			extend ActiveSupport::Concern

			included do
				initialize_formatter
				helper_method :render_breadcrumbs
			end

			def render_breadcrumbs(options = {})
				SimpleBreadcrumb.formatter.render(SimpleBreadcrumb.container)
			end

			private

			def initialize_formatter
				SimpleBreadcrumb.formatter = SimpleBreadcrumb::Formatter.new

				
				
			end			


		end
	end
end