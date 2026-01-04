class CreateAiRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :ai_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ai_module, null: false, foreign_key: true
      t.text :input_data
      t.string :request_status

      t.timestamps
    end
  end
end
