class CreateNewVariants < ActiveRecord::Migration
  def up
    create_table :variants, :force => true do |t|
      t.integer :sellable_id
      t.string :sku
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :quantity
      t.boolean :unlimited_inventory
      t.timestamps
    end
  end

  def down
    drop_table :variants
  end
end