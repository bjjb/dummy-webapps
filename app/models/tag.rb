class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :taggables, :through => :taggings

  validates_presence_of :name
  validates_uniqueness_of :name
end
