require_relative '../../spec_helper'

describe SimpleBreadcrumb::Crumb do

  context "creating a crumb" do
    it "should take a string value" do
      first_crumb = SimpleBreadcrumb::Crumb.new("hola")
      first_crumb.content.should eql("hola")
    end

    it "should take an url" do
      first_crumb = SimpleBreadcrumb::Crumb.new("hola", "/home")
      first_crumb.content.should eql("hola")
      first_crumb.url.should eql("/home")
    end

    it "should take default options" do
      first_crumb = SimpleBreadcrumb::Crumb.new("hola")
      first_crumb.html_tag.should eql(SimpleBreadcrumb::Config.crumb_tag)
      first_crumb.html_wrapper_tag.should eql(SimpleBreadcrumb::Config.crumb_wrapper_tag)
    end

    it "should take html options" do
      first_crumb = SimpleBreadcrumb::Crumb.new("hola", nil, :html_options => {:class => 'test'} )
      first_crumb.tag_html_options.should eql({:class => 'test'})
    end

    it "should take wrapper html options" do
      first_crumb = SimpleBreadcrumb::Crumb.new("hola", nil, :wrapper_html_options => {:class => 'test'} )
      first_crumb.wrapper_html_options.should eql({:class => 'test'})
    end

    it "should take anchor html options" do
      first_crumb = SimpleBreadcrumb::Crumb.new("hola", nil, :anchor_html_options => {:class => 'test'} )
      first_crumb.anchor_html_options.should eql({:class => 'test'})
    end

  end

end

