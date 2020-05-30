# == Schema Information
#
# Table name: wb_api_keys
#
#  id              :bigint           not null, primary key
#  key             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_wb_api_keys_on_key              (key)
#  index_wb_api_keys_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class WbApiKey < ApplicationRecord
  belongs_to :organization
end
