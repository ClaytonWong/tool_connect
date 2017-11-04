class Tool < ApplicationRecord
  include ToolImageUploader[:image]
  
  belongs_to :owner, class_name: 'User'
end
