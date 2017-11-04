# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_o1 = User.create!(email: 'o1@o1.com', password:'123456', password_confirmation:'123456')
user_o2 = User.create!(email: 'o2@o2.com', password:'123456', password_confirmation:'123456')
user_h1 = User.create!(email: 'h1@h1.com', password:'123456', password_confirmation:'123456')

profile_o1 = Profile.create!(user_id: user_o1.id, username: 'owner1', family_name: 'Sample', first_name: 'Sam', date_of_birth: Date.new(1978,2,3), country: 'AU', state: 'Victoria', postcode: 3000, suburb: 'Melbourne', street_address: '120 Spencer Street', level: 13, unit: 8, ph_num: '+61 3 1111 1111', mob_num: '+61 3 1111 1111')

profile_o2 = Profile.create!(user_id: user_o2.id, username: 'owner2', family_name: 'Sample', first_name: 'Dave', date_of_birth: Date.new(1978,2,3), country: 'AU', state: 'Victoria', postcode: 3000, suburb: 'Melbourne', street_address: '120 Spencer Street', level: 13, unit: 8, ph_num: '+61 3 1111 1111', mob_num: '+61 3 1111 1111')

profile_h1 = Profile.create!(user_id: user_h1.id, username: 'hirer1', family_name: 'Example', first_name: 'John', date_of_birth: Date.new(1978,2,3), country: 'AU', state: 'Victoria', postcode: 3000, suburb: 'Melbourne', street_address: '120 Spencer Street', level: 13, unit: 1, ph_num: '+61 3 1111 1112', mob_num: '+61 3 1111 1112')

tool_o1 = Tool.create!(owner_id: user_o1.id, name: 'Pace Soldering Station', description: 'Pace soldering station with soldering iron', cost_of_hire_cents: 100)