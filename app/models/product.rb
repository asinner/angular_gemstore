class Product < ActiveRecord::Base
  has_many :images
  has_many :reviews
  validates :name, presence: true
end
