require 'action_view'

module SimpleBreadcrumb

  class Formatter

    def initialize
      @context = ActionView::Base.new
    end

    def render(obj, options = {})

      options = merge_options(options, obj)

      if obj.is_a? Crumb
        inner_content = (obj.url.blank?? obj.content : @context.link_to(obj.content, obj.url, options[:anchor_html_options] ))
      elsif obj.is_a? CrumbContainer
        objects = []
        last_index = obj.size - 1

        obj.each_with_index do |content_obj, index|
          opts = {:anchor_html_options => {:class => SimpleBreadcrumb::Config.last_class}} if (index == last_index && !SimpleBreadcrumb::Config.last_class.blank?)
          opts ||= {}
          objects << render(content_obj, opts)
        end

        inner_content = objects.join('').html_safe
      end

      outter_content =	@context.content_tag(obj.html_tag, inner_content, options[:tag_html_options])

      obj.html_wrapper_tag.blank?? outter_content : @context.content_tag(obj.html_wrapper_tag, outter_content, options[:wrapper_html_options])

    end

    private

    def merge_options(options, obj)
    	options = {:anchor_html_options => {}, :tag_html_options => {}, :wrapper_html_options => {}}.merge options

      options[:anchor_html_options] 	= options[:anchor_html_options].merge obj.anchor_html_options if obj.respond_to?(:anchor_html_options) && !obj.anchor_html_options.blank?
      options[:tag_html_options] 			= options[:tag_html_options].merge obj.tag_html_options
      options[:wrapper_html_options] 	= options[:wrapper_html_options].merge obj.wrapper_html_options
      options
    end

  end


end
