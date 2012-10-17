module Piggybak
  class OptionValue < ActiveRecord::Base
    attr_accessible :name, :position
    has_and_belongs_to_many :variants
    belongs_to :option, :inverse_of => :option_values
  end
end