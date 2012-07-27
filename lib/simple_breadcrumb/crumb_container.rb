module SimpleBreadcrumb

	class CrumbContainer

		include Enumerable

		attr_accessor :html_tag, :html_wrapper_tag, :tag_html_options, :wrapper_html_options

		def initialize(options = {})
			@html_tag = options[:html_tag] || SimpleBreadcrumb.container_tag
			@html_wrapper_tag = options[:html_wrapper_tag] || SimpleBreadcrumb.container_wrapper_tag

			@tag_html_options = options[:html_options] || SimpleBreadcrumb.container_html_options
			@wrapper_html_options = options[:wrapper_html_options] || SimpleBreadcrumb.container_wrapper_html_options

			@crumbs = []
		end

		def add_crumb(crumb_text)
			@crumbs << SimpleBreadcrumb::Crumb.new(crumb_text)
		end

		def each(&block)
			@crumbs.each(&block)
		end
		
		def last
			@crumbs.last
		end


	end
end