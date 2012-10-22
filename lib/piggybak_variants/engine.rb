module PiggybakVariants
  class Engine < ::Rails::Engine
    isolate_namespace PiggybakVariants
    
  
    initializer "piggybak.rails_admin_config" do |app|
      RailsAdmin.config do |config|
        config.model PiggybakVariants::OptionConfiguration do
          visible false
          object_label_method :admin_label
          edit do
            field :klass
          end
        end

        config.model PiggybakVariants::OptionValue do
          visible false
          edit do
            field :name
            field :position
          end
        end

        config.model PiggybakVariants::Option do
          navigation_label "Variants"
          list do
            field :name
            field :position
            field :option_values
            field :option_configurations
          end
          edit do
            field :name
            field :position
            field :option_configurations do
              active true
            end
            field :option_values do
              active true
            end
          end
        end
        
        config.model PiggybakVariants::Variant do
          show do
            field :option_values do
              visible true
            end
          end
          edit do
            field :option_values
            field :piggybak_sellable do
              active true
            end
          end
        end
      end
    end
  end
end
