module SimpleBreadcrumb
	class Crumb

		attr_accessor :content, :url, :html_tag, :tag_html_options, :html_wrapper_tag, :wrapper_html_options, :anchor_html_options

		def initialize(content, url = nil, options = {})

			@html_tag = options[:html_tag] || SimpleBreadcrumb.crumb_tag
			@html_wrapper_tag = options[:html_wrapper_tag] || SimpleBreadcrumb.crumb_wrapper_tag

			@tag_html_options = options[:html_options]
			@wrapper_html_options = options[:wrapper_html_options]
			@anchor_html_options = options[:anchor_html_options]

			@content = content
			@url = url
		end


		def to_s
			@value.to_s
		end

	end
end