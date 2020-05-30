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
FactoryBot.define do
  factory :organization do
    name { "MyString" }
    inn { "MyString" }
  end
end
