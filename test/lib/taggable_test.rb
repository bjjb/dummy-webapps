require "test_helper"

class TaggableTest < Test::Unit::TestCase
  class Pigeon
    @has_many = {}

    def self.has_many(*args)
      things = args.shift
      return @has_many unless things
      @has_many[things] = args.shift
    end

    def tags
      @tags ||= Class.new(Array) do
        def find_or_create_by_name(name)
          find { |x| x.name == name } || push(OpenStruct.new(:name => name))
        end
      end.new
    end

    include Taggable
  end

  def test_has_many_taggings
    assert_equal({ :as => :taggable }, Pigeon.has_many[:taggings])
  end

  def test_has_many_tags
    assert_equal({ :through => :taggings }, Pigeon.has_many[:tags])
  end

  def test_tag_with
    pigeon = Pigeon.new
    pigeon.tag_with(['foo', 'bar'])
    assert_equal ['foo', 'bar'], pigeon.tags.map(&:name)
  end

  def test_tag_name_assignment
    pigeon = Pigeon.new
    pigeon.tag_names = "Foo,Bar"
    assert_equal ['foo', 'bar'], pigeon.tags.map(&:name)
  end

  def test_tag_hames
    pigeon = Pigeon.new
    pigeon.tag_with(["foo", "bar"])
    assert_equal "foo,bar", pigeon.tag_names
  end
end
