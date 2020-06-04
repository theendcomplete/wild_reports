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
FactoryBot.define do
  factory :sales_info do
    date { Date.current }
    discount_percent { 0 }
    last_change_date { DateTime.current }
    number { "" }
    quantity { rand(1..100) }
    total_price { Faker::Commerce.price }
    income_id { Faker::String.unique.random }
    item_id { Faker::String.unique.random }
    order_id { Faker::String.random }
    sale_id { Faker::String.random }
  end
end
