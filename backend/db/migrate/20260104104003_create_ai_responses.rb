class CreateAiResponses < ActiveRecord::Migration[8.1]
  def change
    create_table :ai_responses do |t|
      t.references :ai_request, null: false, foreign_key: true
      t.text :output_data
      t.integer :processing_time

      t.timestamps
    end
  end
end
