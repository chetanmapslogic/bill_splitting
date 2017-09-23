class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :cost
      t.integer :creditor_id
      t.integer :debtor_id
      t.integer :shopping_id
      t.integer :purchase_id

      t.timestamps null: false
    end
  end
end
