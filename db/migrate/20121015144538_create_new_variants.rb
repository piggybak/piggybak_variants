class CreateNewVariants < ActiveRecord::Migration
  def up
    create_table :variants, :force => true do |t|
      t.integer :item_id, :null => false
      t.string :item_type, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :variants
  end
end
