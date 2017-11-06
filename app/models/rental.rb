class Rental < ApplicationRecord
  belongs_to :tool
  belongs_to :hirer, class_name: 'User'
end
