class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.references :customer, references: :users, null: false, foreign_key: { to_table: :users}
      t.references :courier, references: :users, null: false, foreign_key: { to_table: :users}
      t.decimal :total_price

      t.timestamps
    end
  end
end
