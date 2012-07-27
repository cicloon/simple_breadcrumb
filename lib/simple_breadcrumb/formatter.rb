require 'action_view'

module SimpleBreadcrumb

	class Formatter

		def initialize
			@context = ActionView::Base.new
		end

		def render(obj)
			
			if obj.is_a? Crumb
				inner_content = (obj.url.blank?? obj.content : @context.link_to(obj.content, obj.url, obj.anchor_html_options))
			elsif obj.is_a? CrumbContainer
				objects = []
				obj.each{|content_obj| objects << render(content_obj) }				
				inner_content = objects.join('')
			end
			
			outter_content =	@context.content_tag obj.html_tag, inner_content, obj.tag_html_options

			obj.html_wrapper_tag.blank?? outter_content : @context.content_tag(obj.html_wrapper_tag, outter_content, obj.wrapper_html_options)

		end

	end

end