class CreateWbApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :wb_api_keys do |t|
      t.string :key, null: false, index: true
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
