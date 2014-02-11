class User < ActiveRecord::Base
  has_many :wares, :class_name => 'Product'
end
