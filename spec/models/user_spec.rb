# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string           default(""), not null
#  jti                    :string           not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("customer"), not null
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
    expect(create(:user, :customer)).to be_valid
    expect(create(:user, :admin)).to be_valid
  end

  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_most(255) }
  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_most(255) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_most(255) }
  it { is_expected.to allow_value("email@address.foo").for(:email) }
  it { is_expected.to_not allow_value("email").for(:email) }
  it { is_expected.to_not allow_value("email@domain").for(:email) }
  it { is_expected.to_not allow_value("email@domain.").for(:email) }
  it { is_expected.to_not allow_value("email@domain.a").for(:email) }

  # Callbacks
  describe "#setup_new_user" do
    let(:user) { build(:user) }
    it "sets role to customer" do
      expect(user.role).to eq "customer"
    end
  end

  # Methods
  describe "#name" do
    it "returns first and lastname" do
      expect(create(:user, first_name: "A", last_name: "B").name).to eq "A B"
    end
  end
end
