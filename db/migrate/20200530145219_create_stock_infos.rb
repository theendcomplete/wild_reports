class CreateStockInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_infos do |t|
      t.belongs_to :item, index: true
      t.datetime :last_change_date
      t.string :supplier_article
      t.string :tech_size
      t.integer :quantity
      t.boolean :is_supply
      t.boolean :is_realization
      t.integer :quantity_full
      t.integer :quantity_not_in_orders
      t.string :warehouse_name, index: true
      t.integer :in_way_to_client
      t.integer :in_way_from_client
      t.integer :nm_id
      t.string :subject
      t.string :category
      t.integer :days_on_site
      t.string :brand
      t.integer :price
      t.integer :discount

      t.timestamps

      t.index(%i[item_id last_change_date], unique: true)

    end
  end
end
