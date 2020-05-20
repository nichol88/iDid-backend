class User < ApplicationRecord
  has_secure_password
  has_many :actions

  validates :email, uniqueness: true, presence: true
  validates :fname, presence: true
  validates :lname, presence: true
end
