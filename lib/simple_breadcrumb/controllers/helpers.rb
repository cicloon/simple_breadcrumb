module SimpleBreadcrumb
	module Controllers
		module Helpers
			extend ActiveSupport::Concern

			included do
				initialize_sb
				helper_method :add_breadcrumb
			end

			def add_breadcrumb(crumb_text, url = nil, options = {})
				SimpleBreadcrumb.container.add_crumb(crumb_text, url, options)
			end

			private

			def initialize_sb
				SimpleBreadcrumb.container 	= SimpleBreadcrumb::CrumbContainer.new				
			end			


		end
	end
end