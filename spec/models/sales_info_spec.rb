# == Schema Information
#
# Table name: sales_infos
#
#  id               :bigint           not null, primary key
#  date             :datetime
#  discount_percent :integer
#  last_change_date :datetime
#  number           :string
#  quantity         :integer
#  total_price      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  income_id        :string
#  item_id          :bigint           not null
#  order_id         :string
#  sale_id          :string
#
# Indexes
#
#  index_sales_infos_on_item_id                       (item_id)
#  index_sales_infos_on_item_id_and_last_change_date  (item_id,last_change_date) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#
require "rails_helper"

RSpec.describe SalesInfo, type: :model do
  subject(:sales_info) { build(:sales_info) }

  context "associations" do
    let(:item) { create(:item) }

    it { is_expected.to belong_to(:item) }

    it "is can be associated with item" do
      sales_info.item = item
      expect(sales_info).to be_valid
    end
  end
end
