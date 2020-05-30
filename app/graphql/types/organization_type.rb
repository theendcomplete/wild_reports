module Types
  class OrganizationType < BaseModel
    field :inn, String, null: false
    field :name, String, null: false
    field :items, [Types::ItemType], null: true
  end
end
