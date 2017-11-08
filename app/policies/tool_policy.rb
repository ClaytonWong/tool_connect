class ToolPolicy < ApplicationPolicy
    def show?
      # If current user owns current tool
      if user.id == record.owner.id
        true
      else
        false
      end
    end
  
    def update?
      # If current user owns current tool
      if user.id == record.owner.id
        true
      else
        false
      end
    end
  end