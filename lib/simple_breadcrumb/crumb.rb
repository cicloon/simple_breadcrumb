module SimpleBreadcrumb
	class Crumb

		def initialize(value, options = {})
			@value = value
		end


		def to_s
			@value.to_s
		end

	end
end