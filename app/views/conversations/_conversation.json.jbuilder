json.extract! conversation, :id, :owner_id, :hirer_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
