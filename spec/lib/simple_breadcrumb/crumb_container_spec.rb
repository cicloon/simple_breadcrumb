require_relative '../../spec_helper'

describe SimpleBreadcrumb::CrumbContainer do

  context "when initializing" do

    it "should take default options" do
      cc = SimpleBreadcrumb::CrumbContainer.new
      cc.html_tag.should eql(SimpleBreadcrumb::Config.container_tag)
      cc.html_wrapper_tag.should eql(SimpleBreadcrumb::Config.container_wrapper_tag)

      cc.tag_html_options.should eql(SimpleBreadcrumb::Config.container_html_options)
      cc.wrapper_html_options.should eql(SimpleBreadcrumb::Config.container_wrapper_html_options)
    end

    it "should accept new options" do
      cc = SimpleBreadcrumb::CrumbContainer.new(:html_tag => :div, :html_wrapper_tag => :div)
      cc.html_tag.should eql(:div)
      cc.html_wrapper_tag.should eql(:div)
    end

    it "should accept html options" do
      cc = SimpleBreadcrumb::CrumbContainer.new(:html_options => {:class => 'test'}, :wrapper_html_options => {:class => 'wrapper_test'} )

      cc.tag_html_options.should eql(:class => 'test')
      cc.wrapper_html_options.should eql(:class => 'wrapper_test')

    end

  end

  describe "#add_crumb" do

    before(:each) do
      @cc = SimpleBreadcrumb::CrumbContainer.new
    end


    it "should accept a simple crumb" do
      @cc.add_crumb("hola")
      @cc.last.content.should eql("hola")
    end

    it "should respect order" do
      @cc.add_crumb("hola")
      @cc.add_crumb("adios")
      @cc.first.content.should eql("hola")
      @cc.last.content.should eql("adios")
    end

    it "should contain real crumbs" do
      @cc.add_crumb("hola")
      @cc.first.class.name.should eql("SimpleBreadcrumb::Crumb")
    end

    it "should add crumbs with url" do
      @cc.add_crumb("hola", "/home")
      @cc.first.url.should eql("/home")
    end

    it "should add crumbs with html options" do
      @cc.add_crumb("hola", "/home", :html_options => {:class => 'test'})
      @cc.first.url.should eql("/home")
      @cc.first.tag_html_options.should eql({:class => 'test'})
    end


  end

end