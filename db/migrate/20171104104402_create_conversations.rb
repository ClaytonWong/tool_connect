class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :owner, foreign_key: { to_table: :users}
      t.references :hirer, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
