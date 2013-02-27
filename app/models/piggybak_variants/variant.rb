module PiggybakVariants
  class Variant < ActiveRecord::Base
    self.table_name = "variants"

    acts_as_sellable
    belongs_to :item, :polymorphic => true
    has_and_belongs_to_many :option_values

    attr_accessible :option_value_ids, :piggybak_sellable_attributes

    scope :available, joins(:piggybak_sellable).where(["sellables.active = ? AND (sellables.quantity > 0 OR sellables.unlimited_inventory = ?)",true,true]) 
    validate :option_value_validation

    def admin_label
      "#{self.piggybak_sellable.sku}: #{self.piggybak_sellable.price}"
    end

    def option_value_validation
      # TODO: Figure out why this validation is only being called sometime
      # TODO: Add verification to prevent duplicate option value sets

      klass = self.item.class
      options = ::PiggybakVariants::OptionConfiguration.find_all_by_klass(klass).collect { |oc| oc.option }
      error = false
      options.each do |option|
        matching_option_values = self.option_values.select { |ov| ov.option == option }.size
        if matching_option_values > 1
          self.errors.add(:option_values, "You must have only option value for #{option.name}")
          error = true
        elsif matching_option_values < 1 
          self.errors.add(:option_values, "You must have one option value for #{option.name}")
          error = true
        end
      end 
      self.errors.add(:base, "Option value errors") if error
    end
  end
end
