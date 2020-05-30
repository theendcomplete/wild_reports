module Types
  class OrganizationType < BaseModel
    field :inn, String, null: false
    field :name, String, null: false
  end
end
