class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.references :tool, foreign_key: true
      t.references :hirer, foreign_key: { to_table: :users}
      t.string :charge_identifier
      t.datetime :start_of_hire
      t.datetime :end_of_hire

      t.timestamps
    end
  end
end
