# == Schema Information
#
# Table name: user_organizations
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_user_organizations_on_organization_id  (organization_id)
#  index_user_organizations_on_user_id          (user_id)
#
class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :user, presence: true
  validates :user_id, uniqueness: {scope: :organization}, presence: true
end
