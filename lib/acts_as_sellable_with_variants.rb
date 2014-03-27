module Piggybak
  module ActsAsSellableWithVariants
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_sellable_with_variants
        has_many :variants, :dependent => :destroy, :class_name => "::PiggybakVariants::Variant", :as => :item

        accepts_nested_attributes_for :variants, :allow_destroy => true
        
        ::PiggybakVariants::OptionConfiguration::VARIANT_CLASSES << self.to_s
      end      
    end
  end
end

::ActiveRecord::Base.send :include, Piggybak::ActsAsSellableWithVariants
