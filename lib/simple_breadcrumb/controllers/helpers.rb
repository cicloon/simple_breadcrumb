module SimpleBreadcrumb
	module Controllers
		module Helpers
			extend ActiveSupport::Concern

			included do
				SimpleBreadcrumb.container = SimpleBreadcrumb::CrumbContainer.new				
				helper_method :add_breadcrumbs
				helper_method :add_crumb

				before_filter :add_breadcrumbs

			end

			def add_crumb(crumb_text, url = nil, options = {})
				self.container.add_crumb(crumb_text, url, options)
			end

			def add_breadcrumbs
			end

			def container 
				@container ||= SimpleBreadcrumb::CrumbContainer.new				
			end





		end
	end
end