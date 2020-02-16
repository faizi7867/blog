class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  belongs_to :user
  has_many :comments
end
