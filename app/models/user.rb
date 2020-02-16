class User < ApplicationRecord
  attr_accessor :login

  has_many :permissions   
  has_many :roles, through: :permissions
  has_many :articles
  has_many :postcomments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication warder_condition
    conditions = warder_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {
      value: login.strip.downcase
    }]).first
  end
end
