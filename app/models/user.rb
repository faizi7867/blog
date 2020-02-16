class User < ApplicationRecord
  enum gender: [:undisclosed, :female, :male, :other]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :permissions  
  has_many :roles , through: :permissions
  has_many :comments
  belongs_to :gender


end
