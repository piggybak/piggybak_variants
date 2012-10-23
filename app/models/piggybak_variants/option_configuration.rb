module PiggybakVariants
  class OptionConfiguration < ActiveRecord::Base
    self.table_name = "option_configurations"

    VARIANT_CLASSES = []

    attr_accessible :klass, :option_id
    belongs_to :option

    def klass_enum
      VARIANT_CLASSES
    end

    def admin_label
      self.klass
    end
  end
end
