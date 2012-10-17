class CreateOptionValuesVariants < ActiveRecord::Migration
  def up
    create_table :option_values_variants, :force => true do |t|
      t.integer :option_value_id
      t.integer :variant_id
      t.timestamps
    end
  end

  def down
    drop_table :option_values_variants
  end
end