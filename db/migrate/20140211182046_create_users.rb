class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string :type, :default => 'User'
      t.string :email, :null => false
      t.string :name
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end

  def self.down
    remove_index :users, :email

    drop_table :users
  end
end
