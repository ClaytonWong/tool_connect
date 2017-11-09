class MessagePolicy < ApplicationPolicy
    def show?
      # If current user is part of current conversation
      if user.id == record.conversation.owner_id || user.id == record.conversation.hirer_id
        true
      else
        false
      end
    end
  end