class Message < ApplicationRecord
  attr_accessor :readed_at
  acts_as_readable :on => :created_at
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

end
