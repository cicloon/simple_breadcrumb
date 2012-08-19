module SimpleBreadcrumb

	class Engine < Rails::Engine

		initializer 'simple_breadcrumb.initialize' do |app|
			ActiveSupport.on_load(:action_controller) do
				include SimpleBreadcrumb::Controllers::Helpers
			end

			ActiveSupport.on_load(:action_view) do
				include SimpleBreadcrumb::Views::Helpers
			end

			
		end




	end

end