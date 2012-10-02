class Quote < ActiveRecord::Base
  attr_accessible :content, :source

  has_many :comments, dependent: :destroy
end
