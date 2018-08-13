class Movie < ActiveRecord::Base
  has_many :posts
end
