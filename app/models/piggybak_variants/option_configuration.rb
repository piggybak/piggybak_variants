module PiggybakVariants
  class OptionConfiguration < ActiveRecord::Base
    self.table_name = "option_configurations"

    attr_accessible :klass, :option_id
    belongs_to :option

    def klass_enum
      ["Shirt"]
    end

    def admin_label
      self.klass
    end
  end
end
