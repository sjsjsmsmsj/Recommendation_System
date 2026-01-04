class CreateUsageHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :usage_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ai_module, null: false, foreign_key: true
      t.references :ai_request, null: false, foreign_key: true
      t.timestamp :used_at

      t.timestamps
    end
  end
end
