class Post < ActiveRecord::Base
  attr_accessible :tags, :text, :title

  serialize :tags

  before_create :serialize_tags

  def serialize_tags
  	self.tags = self.tags.split(",").reduce([]) { |acc, tag| acc << tag.strip }
  end

  def self.by_tag(tag)
    where(arel_table[:tags].matches("%#{tag}%"))
  end
end
