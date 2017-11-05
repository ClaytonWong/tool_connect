class Conversation < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :hirer, class_name: 'User'
  has_many :messages
end
