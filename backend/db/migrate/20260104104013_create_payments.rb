class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :payment_method
      t.string :payment_status
      t.timestamp :paid_at

      t.timestamps
    end
  end
end
