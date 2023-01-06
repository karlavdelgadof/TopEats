class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.references :address, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
