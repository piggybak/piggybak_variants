module PiggybakVariants
  class Option < ActiveRecord::Base
    self.table_name = "options"

    attr_accessible :name, :position
    has_many :option_values
    has_many :option_configurations

    accepts_nested_attributes_for :option_values, :allow_destroy => true
    attr_accessible :option_values_attributes, :allow_destroy => true

    accepts_nested_attributes_for :option_configurations, :allow_destroy => true
    attr_accessible :option_configurations_attributes, :allow_destroy => true
  end
end
