require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection('adapter' => 'sqlite3', 'database' => ':memory:')

def create_table(*args, &block)
  ActiveRecord::Base.connection.create_table(*args, &block)
end

ActiveRecord::Base.connection.create_table :users do |t|
  t.string :type, default: 'User'
  t.string :email, nil: false, unique: true, index: true
  t.string :name
  t.timestamps
end

ActiveRecord::Base.connection.create_table :products do |t|
  t.string :name
  t.belongs_to :user, index: true
  t.timestamps
end

ActiveRecord::Base.connection.create_table :tags do |t|
  t.string :name, unique: true
  t.belongs_to :tagging, index: true
  t.timestamps
end

ActiveRecord::Base.connection.create_table :taggings do |t|
  t.belongs_to :taggable, :polymorphic => true, index: true
  t.belongs_to :tag, index: true
end

ActiveRecord::Base.connection.create_table :categories do |t|
  t.string :name
  t.timestamps
end

ActiveRecord::Base.connection.create_table :categories_products, :id => false do |t|
  t.references :category
  t.references :product
end

class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  attr_accessor :name
end

class Product < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  has_and_belongs_to_many :categories
  attr_accessor :email, :name
end

class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :taggables, :through => :taggings
  attr_accessor :name
end

class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
  attr_accessor :taggable
end

class User < ActiveRecord::Base
  has_many :wares, :class_name => 'Product'
end

class Administrator < User
end

def seed!
  alice = Administrator.create! { |u| u.email, u.name = 'alice@example.com', 'Alice' }
  anorak = alice.wares.create! { |p| p.name = 'Anorak' }
  armchair = alice.wares.create! { |p| p.name = 'Armchair' }
  bob = User.create! { |u| u.email, u.name = 'bob@example.com', 'Bob' }
  bun = bob.wares.create! { |p| p.name = 'Bun' }
  biscuit = bob.wares.create! { |p| p.name = 'Biscuit' }
  cecil = User.create! { |u| u.email, u.name = 'cecil@example.com', 'Cecil' }
  crisps = cecil.wares.create! { |p| p.name = 'Crisps' }
  chips = cecil.wares.create! { |p| p.name = 'Chips' }
  anorak.categories << Category.find_or_create_by(name: 'Clothes')
  armchair.categories << Category.find_or_create_by(name: 'Furniture')
  [bun, biscuit, crisps, chips].each { |x| Category.find_or_create_by(name: 'Food') }
  [bun, biscuit].each { |x| x.tags << Tag.find_or_create_by(name: 'Baked') }
  [crisps, chips].each { |x| x.tags << Tag.find_or_create_by(name: 'Unhealthy') }
end

seed!

if $0 == __FILE__
  require "pry"
  binding.pry
end
