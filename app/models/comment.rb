class Comment < ActiveRecord::Base
  attr_accessible :content, :username

  belongs_to :quote
end
