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
require 'rails_helper'

RSpec.describe SalesInfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
