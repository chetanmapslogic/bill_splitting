class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :date_purchased
      t.string :location
      t.decimal :cost
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
