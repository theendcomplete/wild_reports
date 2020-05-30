class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :user, presence: true
  validates :user_id, uniqueness: {scope: :organization}, presence: true
end
