module PiggybakVariants
  class Engine < ::Rails::Engine
    isolate_namespace PiggybakVariants
    
  
    initializer "piggybak.rails_admin_config" do |app|
      RailsAdmin.config do |config|
        config.model Piggybak::Option do
          configure :option_values do
                # configuration here
          end
          list do 
            include_all_fields
          end
          edit do
            include_all_fields
          end
        end
        
        config.model Piggybak::Variant do
          configure :option_values do
            inverse_of :variants
          end
          show do
            field :option_values do
              visible true
            end
            field :options do
              visible false
            end
            
          end
          edit do
            include_all_fields
          end
        end
      end
    end
  end
end
