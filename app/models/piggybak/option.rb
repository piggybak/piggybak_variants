module Piggybak
  class Option < ActiveRecord::Base
    attr_accessible :name, :position
    belongs_to :variants
    has_many :option_values
    accepts_nested_attributes_for :option_values, :allow_destroy => true
    attr_accessible :option_values_attributes, :allow_destroy => true
    
  end
end