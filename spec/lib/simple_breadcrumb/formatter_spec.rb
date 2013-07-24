require_relative '../../spec_helper'

describe SimpleBreadcrumb::Formatter do

  describe "#render" do
    context "a crumb" do
      before(:each) do
        @formatter = SimpleBreadcrumb::Formatter.new
        @crumb = SimpleBreadcrumb::Crumb.new('test')

        @tag = SimpleBreadcrumb::Config.crumb_tag.to_s

        @wrapper_tag_start  = SimpleBreadcrumb::Config.crumb_wrapper_tag.blank? ? '' : "<#{SimpleBreadcrumb::Config.crumb_wrapper_tag.to_s}>"
        @wrapper_tag_end    = SimpleBreadcrumb::Config.crumb_wrapper_tag.blank? ? '' : "</#{SimpleBreadcrumb::Config.crumb_wrapper_tag.to_s}>"

      end

      it "should render a default crumb" do
        html = @formatter.render(@crumb)
        html.should eql("#{@wrapper_tag_start}<#{@tag}>#{@crumb.content}</#{@tag}>#{@wrapper_tag_end}")
      end

      it "should render a crumb with url" do
        @crumb.url = '/home'
        html = @formatter.render(@crumb)
        html.should eql("#{@wrapper_tag_start}<#{@tag}><a href=\"#{@crumb.url}\">#{@crumb.content}</a></#{@tag}>#{@wrapper_tag_end}")
      end

      it "should render a crumb with url and html options" do
        @crumb.html_tag         = :span
        @crumb.html_wrapper_tag = :div
        @crumb.url = '/home'

        @crumb.tag_html_options     = {:class => 'tag_class', :id => 'tag_id'}
        @crumb.wrapper_html_options = {:class => 'wrapper_class', :id => 'wrapper_id'}
        @crumb.anchor_html_options  = {:class => 'anchor_class', :id => 'anchor_id'}

        html = @formatter.render(@crumb)

        html.should eql("<div class=\"wrapper_class\" id=\"wrapper_id\"><span class=\"tag_class\" id=\"tag_id\"><a href=\"#{@crumb.url}\" class=\"anchor_class\" id=\"anchor_id\">#{@crumb.content}</a></span></div>")
      end      
    end


    context "a container" do

      before(:each) do
        @cc = SimpleBreadcrumb::CrumbContainer.new
        @formatter = SimpleBreadcrumb::Formatter.new

        @container_tag = SimpleBreadcrumb::Config.container_tag.to_s
        @cw_tag_start   = SimpleBreadcrumb::Config.container_wrapper_tag.blank? ? '' : "<#{SimpleBreadcrumb::Config.container_wrapper_tag.to_s}>"
        @cw_tag_end   = SimpleBreadcrumb::Config.container_wrapper_tag.blank? ? '' : "</#{SimpleBreadcrumb::Config.container_wrapper_tag.to_s}>"

        @crumb_tag = SimpleBreadcrumb::Config.crumb_tag.to_s
        @wrapper_tag_start  = SimpleBreadcrumb::Config.crumb_wrapper_tag.blank? ? '' : "<#{SimpleBreadcrumb::Config.crumb_wrapper_tag.to_s}>"
        @wrapper_tag_end    = SimpleBreadcrumb::Config.crumb_wrapper_tag.blank? ? '' : "</#{SimpleBreadcrumb::Config.crumb_wrapper_tag.to_s}>"
      end

      it "should render an empty container" do
        html = @formatter.render(@cc)
        html.should eql("#{@cc_tag_start}<#{@container_tag} class=\"#{SimpleBreadcrumb::Config.container_html_options[:class]}\"></#{@container_tag}>#{@cc_tag_end}")
      end

      it "should render container with one crumb with last link disabled" do
        @cc.add_crumb('first_last')
        html = @formatter.render(@cc)
        html.should eql("#{@cc_tag_start}<#{@container_tag} class=\"#{SimpleBreadcrumb::Config.container_html_options[:class]}\">#{@wrapper_tag_start}<#{@crumb_tag}>#{@cc.first.content}</#{@crumb_tag}>#{@wrapper_tag_end}</#{@container_tag}>#{@cc_tag_end}")
      end

      it "should render container with one crumb with last link enabled" do
        @cc.add_crumb('first_last', '/home')
        html = @formatter.render(@cc)
        html.should eql("#{@cc_tag_start}<#{@container_tag} class=\"#{SimpleBreadcrumb::Config.container_html_options[:class]}\">#{@wrapper_tag_start}<#{@crumb_tag}><a href=\"#{@cc.first.url}\" class=\"#{SimpleBreadcrumb::Config.last_class}\">#{@cc.first.content}</a></#{@crumb_tag}>#{@wrapper_tag_end}</#{@container_tag}>#{@cc_tag_end}")
      end

      it "should render container with one crumb with last class disabled" do
        before_last_class = SimpleBreadcrumb::Config.last_class
        SimpleBreadcrumb::Config.last_class = nil
        @cc.add_crumb('first_last', '/home')
        html = @formatter.render(@cc)
        html.should eql("#{@cc_tag_start}<#{@container_tag} class=\"#{SimpleBreadcrumb::Config.container_html_options[:class]}\">#{@wrapper_tag_start}<#{@crumb_tag}><a href=\"#{@cc.first.url}\">#{@cc.first.content}</a></#{@crumb_tag}>#{@wrapper_tag_end}</#{@container_tag}>#{@cc_tag_end}")
        SimpleBreadcrumb::Config.last_class = before_last_class
      end

      it "should render container with two crumbs" do
        @cc.add_crumb('first', '/home')
        @cc.add_crumb('second', '/second_page')
        html = @formatter.render(@cc)
        html.should eql("#{@cc_tag_start}<#{@container_tag} class=\"#{SimpleBreadcrumb::Config.container_html_options[:class]}\">#{@wrapper_tag_start}<#{@crumb_tag}><a href=\"#{@cc.first.url}\">#{@cc.first.content}</a></#{@crumb_tag}><#{@crumb_tag}><a href=\"#{@cc.last.url}\" class=\"#{SimpleBreadcrumb::Config.last_class}\">#{@cc.last.content}</a></#{@crumb_tag}>#{@wrapper_tag_end}</#{@container_tag}>#{@cc_tag_end}")
      end


    end


  end



end
