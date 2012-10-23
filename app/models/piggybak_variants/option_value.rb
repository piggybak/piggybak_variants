module PiggybakVariants
  class OptionValue < ActiveRecord::Base
    self.table_name = "option_values"

    attr_accessible :name, :position
    has_and_belongs_to_many :variants
    belongs_to :option, :inverse_of => :option_values

    default_scope :order => "position ASC"

    def admin_label
      "#{self.option.name}: #{self.name}"
    end
  end
end
