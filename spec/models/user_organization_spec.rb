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
require "rails_helper"

RSpec.describe UserOrganization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
