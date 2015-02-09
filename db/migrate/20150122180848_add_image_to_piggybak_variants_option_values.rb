class AddImageToPiggybakVariantsOptionValues < ActiveRecord::Migration
  def self.up
    add_attachment :piggybak_variants_option_values, :image
  end

  def self.down
    remove_attachment :piggybak_variants_option_values, :image
  end
end
