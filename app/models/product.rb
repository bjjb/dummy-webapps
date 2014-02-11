require "taggable"

class Product < ActiveRecord::Base
  include Taggable
  belongs_to :user
  has_and_belongs_to_many :categories
end
