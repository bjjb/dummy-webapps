class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags, :force => true do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :tags, :name, :unique => true

    create_table :taggings, :force => true do |t|
      t.references :taggable, :polymorphic => true, :null => false
      t.references :tag, :null => false
      t.timestamps
    end

    add_index :taggings, [:taggable_type, :taggable_id]
    add_index :taggings, :tag_id
  end

  def self.down
    remove_index :taggings, [:taggable_type, :taggable_id]
    remove_index :taggings, :tag_id

    drop_table :taggings

    remove_index :tags, :name, :unique => true

    drop_table :tags
  end
end
