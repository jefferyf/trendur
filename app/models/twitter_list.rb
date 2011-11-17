class TwitterList < ActiveRecord::Base
  attr_accessible :name, :owner, :slug
  
  validates_presence_of :name , :owner , :slug
  
  def is_valid_list?
    begin
      Twitter.list_timeline( self.owner , self.slug ).size > 0
    rescue
      #list will throw a 404 error if not found...
      false
    end
  end
end
