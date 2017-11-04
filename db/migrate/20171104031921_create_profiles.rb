class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.string :family_name
      t.string :middle_names
      t.string :first_name
      t.date :date_of_birth
      t.string :country
      t.string :state
      t.integer :postcode
      t.string :suburb
      t.string :street_address
      t.integer :level
      t.string :unit
      t.decimal :longitude, :decimal, precision: 10, scale: 6
      t.decimal :latitude, :decimal, precision: 10, scale: 6
      t.string :ph_num
      t.string :mob_num

      t.timestamps
    end
  end
end
