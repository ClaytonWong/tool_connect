class ProfilePolicy < ApplicationPolicy
    def show?
      # If current user owns matching profile
      if user.id == record.id
        true
      else
        false
      end
    end
  
    def update?
      # If current user owns matching profile
      if user.id == record.id
        true
      else
        false
      end
    end
  end