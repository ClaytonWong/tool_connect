class CreateTools < ActiveRecord::Migration[5.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.integer :cost_of_hire_cents
      t.references :owner, foreign_key: { to_table: :users}
      t.text :image_data

      t.timestamps
    end
  end
end
