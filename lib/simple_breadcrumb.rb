require "simple_breadcrumb/engine" if defined?(::Rails)
require "simple_breadcrumb/version"

require "active_support"
require "active_support/dependencies"

module SimpleBreadcrumb 

  extend ActiveSupport::Autoload

  autoload :Formatter
  autoload :CrumbContainer
  autoload :Crumb
  autoload :Config


  module Controllers
    autoload :Helpers, 'simple_breadcrumb/controllers/helpers'
  end

  module Views
    autoload :Helpers, 'simple_breadcrumb/views/helpers'
  end

  mattr_accessor :formatter
  mattr_accessor :container

  def self.setup
    yield Config
  end

end
