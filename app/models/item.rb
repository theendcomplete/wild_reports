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
class Item < ApplicationRecord
  belongs_to :organization
  has_many :stock_infos
  has_many :sales_infos

  scope :sold_at_date, lambda { |date = 1.day.ago|
    joins(:sales_infos).where(sales_infos: {date: date.beginning_of_day..date.end_of_day})
  }

  scope :with_donation_count_gt_than, lambda { |count, confirmed = 1|
    # TODO: refactor, analytics use only
    case confirmed
    when 0
      joins(:donations).where(donations: {confirmed_at: nil}).group("users.id, users.created_at").having("count(user_id) > ?", count)
    when 1
      joins(:donations).where.not(donations: {confirmed_at: nil}).group("users.id, users.created_at").having("count(user_id) > ?", count)
    when 3
      joins(:donations).group("users.id, users.created_at").having("count(user_id) > ?", count)
    else
      joins(:donations).group("users.id, users.created_at").having("count(user_id) > ?", count)
    end
  }
end
