class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :organization

      t.string :name
      t.string :barcode
      t.string :wb_code
      t.string :code

      t.timestamps
    end
  end
end
