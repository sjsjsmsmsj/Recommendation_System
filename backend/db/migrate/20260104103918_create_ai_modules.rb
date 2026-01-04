class CreateAiModules < ActiveRecord::Migration[8.1]
  def change
    create_table :ai_modules do |t|
      t.string :name
      t.text :description
      t.string :module_type
      t.boolean :is_active

      t.timestamps
    end
  end
end
