require 'simple_breadcrumb'

describe SimpleBreadcrumb::CrumbContainer do


	context "when adding crumbs" do
	  
		before(:each) do
		  @cc = SimpleBreadcrumb::CrumbContainer.new
		end


		it "should accept a simple crumb" do		  
		  @cc.add_crumb("hola")
		  @cc.last.to_s.should eql("hola")
		end

		it "should respect order" do	  
		  @cc.add_crumb("hola")
		  @cc.add_crumb("adios")
		  @cc.first.to_s.should eql("hola")
		  @cc.last.to_s.should eql("adios")
		end

		it "should contain real crumbs" do
			@cc.add_crumb("hola")
			@cc.first.class.name.should eql("SimpleBreadcrumb::Crumb")
		end
	end

end



describe SimpleBreadcrumb::Crumb do

	context "creating a crumb" do
	  it "should take a string value" do
	    first_crumb = SimpleBreadcrumb::Crumb.new("hola")
	    first_crumb.to_s.should eql("hola")
	  end

	  it "should take a hash parameter" do
	    first_crumb = SimpleBreadcrumb::Crumb.new("hola", :class => 'crumb')
	    first_crumb.to_s.should eql("hola")	    
	  end
	  
	end


end