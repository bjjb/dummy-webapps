class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :categories, :name, :unique => true

    create_table :categories_products, :force => :true, :id => false do |t|
      t.references :category, :null => false
      t.references :product, :null => false
    end

    add_index :categories_products, [:category_id, :product_id], :unique => true
  end

  def self.down
    remove_index :categories_products, [:category_id, :product_id]

    drop_table :categories_products

    remove_index :categories, :name

    drop_table :categories
  end
end
