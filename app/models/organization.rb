# frozen_string_literal: true

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
  has_one :wb_api_key

  validates :name, presence: true, length: {maximum: 150}
  validates :inn, presence: true, inn_format: true
end
