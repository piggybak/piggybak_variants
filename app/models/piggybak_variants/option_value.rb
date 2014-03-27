module PiggybakVariants
  class OptionValue < ActiveRecord::Base
    has_and_belongs_to_many :variants
    belongs_to :option, :inverse_of => :option_values

    scope :hash_ordered, -> { includes(:option).order("piggybak_variants_options.position ASC, piggybak_variants_option_values.position ASC") }

    def admin_label
      "#{self.option.name}: #{self.name}"
    end
  end
end
