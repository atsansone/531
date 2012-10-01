class Quote < ActiveRecord::Base
  attr_accessible :content, :source

  has_many :comments
end
