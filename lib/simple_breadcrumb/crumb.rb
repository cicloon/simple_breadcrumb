module SimpleBreadcrumb
	class Crumb

		attr_accessor :content, :url, :html_tag, :tag_html_options, :html_wrapper_tag, :wrapper_html_options, :anchor_html_options

		def initialize(content, url = nil, options = {})

			@html_tag = options[:html_tag] || SimpleBreadcrumb::Config.crumb_tag
			@html_wrapper_tag = options[:html_wrapper_tag] || SimpleBreadcrumb::Config.crumb_wrapper_tag

			options = {:anchor_html_options => {}, :html_options => {}, :wrapper_html_options => {}}.merge options

			@tag_html_options 		= SimpleBreadcrumb::Config.crumb_tag_html_options.merge options[:html_options]
			@wrapper_html_options = SimpleBreadcrumb::Config.crumb_wrapper_tag_html_options.merge options[:wrapper_html_options]
			@anchor_html_options 	= SimpleBreadcrumb::Config.anchor_html_options.merge options[:anchor_html_options]

			@content = content
			@url = url
			
		end


		def to_s
			@value.to_s
		end

	end
end