module Piggybak
  class Variant < ActiveRecord::Base
    belongs_to :sellable, :inverse_of => :variants, :class_name => "::Piggybak::Sellable"
    has_many :options
    has_and_belongs_to_many :option_values
    
    attr_accessible :sku, :quantity, :price, :unlimited_inventory, :option_value_ids
  end
end