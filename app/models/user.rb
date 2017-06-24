class User < ApplicationRecord
  has_secure_password
  acts_as_reader
  validates :email, presence: true, uniqueness: true
  has_many :received_messages, class_name: "Message", foreign_key: :recipient_id
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id


end
