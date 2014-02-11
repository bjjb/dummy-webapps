module Taggable
  def self.included(mod)
    mod.has_many :taggings, :as => :taggable
    mod.has_many :tags, :through => :taggings
  end

  def tag_with(tags)
    Array(tags).each do |name|
      tag = Tag.find_or_create_by_name(name.downcase)
      self.taggings.find_or_create_by_tag_id(tag.id)
    end
  end

  def tag_names
    tags.map(&:name).join(",")
  end

  def tag_names=(tag_names)
    tag_with(tag_names.split(/\s*,\s*/))
    tag_names
  end
end
