class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products, :force => true do |t|
      t.string :name
      t.belongs_to :user, :null => false
      t.timestamps
    end

    add_index :products, :user_id
  end

  def self.down
    remove_index :products, :user_id

    drop_table :products
  end
end
