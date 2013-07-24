# SimpleBreadcrumb

SimpleBreadcrum aim's to simplify breadcrumb generation yet offering a powerful interface to customize.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_breadcrumb'

And then execute:

    bundle install


## Configuration

Generate an initializer with this:

    SimpleBreadcrumb.setup do |setup|
    end


Possible configuration variables are: 

    container_tag, container html tag for the breadcrumbs, defaults to :ul
    
    container_html_options, html options for the container, defaults to {class: 'simple_breadcrumb'}

    container_wrapper_tag, wrapper for the container, defaults to nil

    container_wrapper_html_options, the same as container_html_options but for the wrapper, defaults to {}

    crumb_tag, html tag for each crumb, defaults to :li

    crumb_tag_html_options, html options for each crumb, defaults to {}

    crumb_wrapper_tag, wrapper for each crumb, defaults to nil

    crumb_wrapper_tag_html_options, html options for crumbs wrapper, defaults to {}

    anchor_html_options, html options for each link in the breadcrumb, defaults to {}

    first_class, allow to specify an specific class for the first crumb, defaults to nil

    last_class, allow to specify an specific class for the last crumb, defaults to 'last'


## Usage
  In your controller actions you can add crumbs this way:

    add_crumb('text', '/url')

  add_crumb accepts all the options applicable to a simple crumb, this means this is highly flexible.


  In your views you can render the breadcrumbs using this helper:

    render_breadcrumbs(options)

  options is a hash accepting the same keys as the gem config.