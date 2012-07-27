Dir[File.join(File.dirname(__FILE__), 'simple_breadcrumb', '*.rb')].each do|file| 
	require file 
end

require "simple_breadcrumb/version"
require "rails"


module SimpleBreadcrumb
  
	mattr_accessor :container_tag
	@@container_tag = :ul

	mattr_accessor :container_html_options
	@@container_html_options = {:class => 'simple_breadcrumb'}	

	mattr_accessor :container_wrapper_tag
	@@container_wrapper_tag = nil

	mattr_accessor :container_wrapper_html_options
	@@container_wrapper_html_options = {}

	mattr_accessor :crumb_tag
	@@crumb_tag = :li

	mattr_accessor :crumb_wrapper_tag
	@@crumb_wrapper_tag = nil

	mattr_accessor :first_class
	@@first_class = nil

	mattr_accessor :last_class
	@@last_class = 'last'

end
