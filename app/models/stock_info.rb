# == Schema Information
#
# Table name: stock_infos
#
#  id                     :bigint           not null, primary key
#  brand                  :string
#  category               :string
#  days_on_site           :integer
#  discount               :integer
#  in_way_from_client     :integer
#  in_way_to_client       :integer
#  is_realization         :boolean
#  is_supply              :boolean
#  last_change_date       :datetime
#  price                  :integer
#  quantity               :integer
#  quantity_full          :integer
#  quantity_not_in_orders :integer
#  subject                :string
#  supplier_article       :string
#  tech_size              :string
#  warehouse_name         :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  item_id                :bigint
#  nm_id                  :integer
#
# Indexes
#
#  index_stock_infos_on_item_id                       (item_id)
#  index_stock_infos_on_item_id_and_last_change_date  (item_id,last_change_date) UNIQUE
#  index_stock_infos_on_warehouse_name                (warehouse_name)
#
class StockInfo < ApplicationRecord
  belongs_to :item

  validates :last_change_date, uniqueness: {scope: :item}, presence: true
end
