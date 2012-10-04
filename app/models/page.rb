class Page < ActiveRecord::Base
  attr_accessible :content, :title, :author
end
