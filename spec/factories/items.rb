# == Schema Information
#
# Table name: items
#
#  id              :bigint           not null, primary key
#  barcode         :string
#  code            :string
#  name            :string
#  wb_code         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_items_on_organization_id  (organization_id)
#
FactoryBot.define do
  factory :item do
    
  end
end
