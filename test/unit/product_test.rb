require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "it belongs to a user" do
    assert_equal users(:bob), products(:bun).user
  end

  test "it can have tags" do
    assert_equal "baked", products(:biscuit).tag_names
    product = products(:bun)
    assert_difference 'Tag.count' do
      product.tag_with "sugary"
    end
    assert_difference 'Tag.count', 2 do
      product.tag_names = "Iced,Glazed"
    end
    assert_equal "baked,sugary,iced,glazed", product.tag_names
  end
end
