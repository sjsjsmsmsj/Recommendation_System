class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :full_name
      t.references :role, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
