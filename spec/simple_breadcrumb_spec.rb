require 'simple_breadcrumb'

describe SimpleBreadcrumb::CrumbContainer do

	it "should accept adding crumbs" do
	  cc = SimpleBreadcrumb::CrumbContainer.new
	  cc.add_crumb("hola")
	  cc.last.should eql("hola")
	end

	it "should respect order" do
	  cc = SimpleBreadcrumb::CrumbContainer.new
	  cc.add_crumb("hola")
	  cc.add_crumb("adios")
	  cc.first.should eql("hola")
	  cc.last.should eql("adios")
	end

end