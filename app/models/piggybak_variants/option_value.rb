module PiggybakVariants
  class OptionValue < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    has_and_belongs_to_many :variants
    belongs_to :option, :inverse_of => :option_values

    scope :hash_ordered, -> { includes(:option).order("piggybak_variants_options.position ASC, piggybak_variants_option_values.position ASC") }

    def admin_label
      "#{self.option.name}: #{self.name}"
    end
  end
end
