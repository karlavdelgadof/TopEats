class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.references :courier, references: :users, null: false, foreign_key: { to_table: :users}
      t.integer :type

      t.timestamps
    end
  end
end
