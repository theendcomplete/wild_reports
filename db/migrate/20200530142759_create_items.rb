class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :organization

      t.string :name, null: false, default: ""
      t.string :barcode, null: false, default: ""
      t.string :wb_code, null: false, default: ""
      t.string :code, null: false, default: ""

      t.timestamps

      t.index(%i[barcode organization_id], unique: true)
      t.index(%i[wb_code organization_id], unique: true)
      t.index(%i[code organization_id], unique: true)
    end
  end
end
