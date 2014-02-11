require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the name is unique" do
    tag = Tag.new(:name => "unhealthy")
    assert !tag.valid?
    tag.name = "unique"
    assert tag.valid?
  end
end
