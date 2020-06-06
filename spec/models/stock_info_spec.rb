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
require "rails_helper"

RSpec.describe StockInfo, type: :model do
  subject(:stock_info) { build(:stock_info) }

  context "associations" do
    let(:item) { create(:item) }

    it { is_expected.to belong_to(:item) }

    it "is can be associated with item" do
      stock_info.item = item
      expect(stock_info).to be_valid
    end
  end
end
