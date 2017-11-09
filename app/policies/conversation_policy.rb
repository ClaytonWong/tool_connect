class ConversationPolicy < ApplicationPolicy
  def show?
    # If current user is part of current conversation
    if user.id == record.owner_id || user.id == record.hirer_id
      true
    else
      false
    end
  end
end