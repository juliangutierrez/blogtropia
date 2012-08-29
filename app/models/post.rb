class Post < ActiveRecord::Base
  attr_accessible :tags, :text, :title

  serialize :tags

  before_save :serialize_tags

  def serialize_tags
  	self.tags = self.tags.split ","
  end

  def tags_as_string
  	self.tags.reduce("") { |acc, i| acc + "#{i}," }
  end
end
