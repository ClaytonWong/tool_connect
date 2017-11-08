class Rental < ApplicationRecord
  belongs_to :tool
  belongs_to :hirer, class_name: 'User'
  
  validates :start_of_hire, :end_of_hire, :overlap => {:scope => "tool_id", :message_title => [:start_at, :end_at], :message_content => "Some validation message"}
end
