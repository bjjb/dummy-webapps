require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "it has a required name unique name" do
    category = categories(:clothes)
    assert category.valid?
    category.name = nil
    assert !category.valid?
    category = Category.new(:name => "Pets")
    assert category.valid?
    category.name = "Clothes"
    assert !category.valid?
    assert category.errors[:name]
  end

  test "it has products" do
    category = categories(:furniture)
    assert_equal [products(:armchair)], category.products
  end
end
