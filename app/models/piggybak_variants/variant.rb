module PiggybakVariants
  class Variant < ActiveRecord::Base
    self.table_name = "variants"

    acts_as_sellable
    belongs_to :item, :polymorphic => true

    has_and_belongs_to_many :option_values
  end
end
