class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
end
