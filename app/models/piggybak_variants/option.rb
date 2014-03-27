module PiggybakVariants
  class Option < ActiveRecord::Base
    has_many :option_values, :dependent => :destroy, order: 'position ASC'
    has_many :option_configurations, :dependent => :destroy

    default_scope :order => "position ASC"

    accepts_nested_attributes_for :option_values, :allow_destroy => true

    accepts_nested_attributes_for :option_configurations, :allow_destroy => true
  end
end
