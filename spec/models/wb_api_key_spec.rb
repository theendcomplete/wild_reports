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
require "rails_helper"

RSpec.describe WbApiKey, type: :model do
  subject(:wb_api_key) { build(:wb_api_key) }

  context "associations" do
    let(:organization) { create(:organization) }

    it { is_expected.to belong_to(:organization) }

    it "is can be associated with item" do
      organization.wb_api_key = wb_api_key
      expect(wb_api_key).to be_valid
    end
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:key) }
  end
end
