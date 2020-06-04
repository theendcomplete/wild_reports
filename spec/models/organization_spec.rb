# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  inn        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Organization, type: :model do
  subject(:organization) { build(:organization) }
  # let(:user_list) { create_list(:user, 4) }

  context "associations" do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:items) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:inn) }

    it "is correct when just built" do
      expect(organization).to be_valid
    end

    it "is incorrect with long name" do
      organization.name = 'a' * 151
      expect(organization).to_not be_valid
    end

    it "is incorrect with incorrect INN" do
      organization.inn = '0' * 6
      expect(organization).to_not be_valid
    end
  end


  context 'can be created' do
    let(:user) { create(:user, :customer) }

    it 'can be created by user' do
      user.organizations << organization
      expect(organization.users).to include(user)
    end

    it 'checks that user can be added to organization' do
      expect(organization.users).not_to include(user)
      organization.users << user
      organization.save!
      expect(organization.users).to include(user)
    end
  end
end
