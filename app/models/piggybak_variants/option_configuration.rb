module PiggybakVariants
  class OptionConfiguration < ActiveRecord::Base
    VARIANT_CLASSES = []

    belongs_to :option

    def klass_enum
      VARIANT_CLASSES
    end

    def admin_label
      self.klass
    end
  end
end
