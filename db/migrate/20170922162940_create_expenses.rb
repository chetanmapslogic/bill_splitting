class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :percentage
      t.integer :user_id
      t.integer :purchase_id

      t.timestamps null: false
    end
  end
end
