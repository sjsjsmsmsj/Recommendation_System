class CreateLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :logs do |t|
      t.string :log_level
      t.text :message

      t.timestamps
    end
  end
end
