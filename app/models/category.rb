class Category < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates_length_of :name, maximum: 30
  validates_length_of :description, minimum: 3, maximum: 300
  
  has_many :articles, dependent: :destroy
end