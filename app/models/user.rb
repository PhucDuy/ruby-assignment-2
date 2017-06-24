class User < ApplicationRecord
  has_secure_password
  acts_as_reader
  validates :email, presence: true, uniqueness: true

end
