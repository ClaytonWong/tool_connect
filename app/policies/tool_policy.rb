class ToolPolicy < ApplicationPolicy
    def update?
      # If current user owns current tool
      if user.id == record.owner_id
        true
      else
        false
      end
    end
  end