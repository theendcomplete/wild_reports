class CreateSalesInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_infos do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.string :number
      t.datetime :date
      t.datetime :last_change_date
      t.integer :quantity
      t.integer :total_price
      t.integer :discount_percent
      t.string :order_id
      t.string :income_id
      t.string :sale_id

      t.timestamps

      t.index(%i[item_id last_change_date], unique: true)
    end
  end
end
