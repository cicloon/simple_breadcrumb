module SimpleBreadcrumb
	class CrumbContainer

		include Enumerable

		def initialize
			@crumbs = []
		end


		def add_crumb(crumb_text)
			@crumbs << SimpleBreadcrumb::Crumb.new(crumb_text)
		end

		def each(&block)
			@crumbs.each(&block)
		end

		# Enumerable doesn't implement last
		def last
			@crumbs.last
		end


	end
end