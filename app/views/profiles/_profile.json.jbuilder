json.extract! profile, :id, :user_id, :username, :family_name, :middle_names, :first_name, :date_of_birth, :country, :state, :postcode, :suburb, :street_address, :level, :unit, :longitude, :latitude, :ph_num, :mob_num, :created_at, :updated_at
json.url profile_url(profile, format: :json)
