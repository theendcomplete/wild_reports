# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id              :bigint           not null, primary key
#  barcode         :string           default(""), not null
#  code            :string           default(""), not null
#  name            :string           default(""), not null
#  wb_code         :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_items_on_barcode_and_organization_id  (barcode,organization_id) UNIQUE
#  index_items_on_code_and_organization_id     (code,organization_id) UNIQUE
#  index_items_on_organization_id              (organization_id)
#  index_items_on_wb_code_and_organization_id  (wb_code,organization_id) UNIQUE
#
FactoryBot.define do
  factory :item do
    barcode { rand(99_999_999) }
    code { Faker::Commerce.unique.product_name }
    name { Faker::Beer.unique.name }
    wb_code { Faker::Internet.unique.device_token }
    organization
  end
end
