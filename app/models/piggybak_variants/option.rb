module PiggybakVariants
  class Option < ActiveRecord::Base
    self.table_name = "options"

    attr_accessible :name, :position
    has_many :option_values, :dependent => :destroy
    has_many :option_configurations, :dependent => :destroy

    default_scope :order => "position ASC"

    accepts_nested_attributes_for :option_values, :allow_destroy => true
    attr_accessible :option_values_attributes, :allow_destroy => true

    accepts_nested_attributes_for :option_configurations, :allow_destroy => true
    attr_accessible :option_configurations_attributes, :allow_destroy => true
  end
end
