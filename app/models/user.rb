class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true, on: :create
end
