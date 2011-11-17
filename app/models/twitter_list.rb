class TwitterList < ActiveRecord::Base
  attr_accessible :name, :owner, :slug
  
  validates_presence_of :name , :owner , :slug
end
