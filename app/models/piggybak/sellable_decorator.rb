Piggybak::Sellable.class_eval do
  has_many :variants, :dependent => :destroy, :inverse_of => :sellable, :class_name => "::Piggybak::Variant"
  accepts_nested_attributes_for :variants, :allow_destroy => true
  attr_accessible :variants_attributes, :allow_destroy => true
end