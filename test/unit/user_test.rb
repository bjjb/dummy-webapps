require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it can have wares" do
    assert users(:alice).wares
  end

  test "it can be an admin" do
    assert_kind_of Administrator, users(:alice)
  end
end
