class Review < ActiveRecord::Base
  validates :stars, presence: true
  validates :body, presence: true
  validates :author, presence: true
end
