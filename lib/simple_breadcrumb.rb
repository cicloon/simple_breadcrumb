require 'formtastic/engine' if defined?(::Rails)
require "simple_breadcrumb/version"

require "active_support"

module SimpleBreadcrumb 

	extend ActiveSupport::Autoload

	autoload :Formatter
	autoload :CrumbContainer
	autoload :Crumb
	autoload :Config


	def self.setup
		yield self
	end

end
