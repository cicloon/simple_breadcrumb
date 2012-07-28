module SimpleBreadcrumb

  class CrumbContainer

    include Enumerable

    attr_accessor :html_tag, :html_wrapper_tag, :tag_html_options, :wrapper_html_options

    def initialize(options = {})
      @html_tag = options[:html_tag] || SimpleBreadcrumb.container_tag
      @html_wrapper_tag = options[:html_wrapper_tag] || SimpleBreadcrumb.container_wrapper_tag

      options = {:html_options => {}, :wrapper_html_options => {}}.merge options

      @tag_html_options 		= SimpleBreadcrumb.container_html_options.merge options[:html_options]
      @wrapper_html_options = SimpleBreadcrumb.container_wrapper_html_options.merge options[:wrapper_html_options]

      @crumbs = []
    end

    def add_crumb(crumb_text, url = nil, options = {})
      @crumbs << SimpleBreadcrumb::Crumb.new(crumb_text, url, options)
    end

    def each(&block)
      @crumbs.each(&block)
    end

    def last
      @crumbs.last
    end

    def size
      @crumbs.size
    end

  end
end
