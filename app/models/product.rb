class Product < ActiveRecord::Base
  validates :name,  presence: true, length: { minimum: 5, maximum: 20 }
  validates :price, presence: true
end
