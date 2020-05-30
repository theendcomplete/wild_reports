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
class Organization < ApplicationRecord
  has_many :user_organizations
  has_many :users, through: :user_organizations
  has_many :items
end
