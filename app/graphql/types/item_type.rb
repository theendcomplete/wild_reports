module Types
  class ItemType < Types::BaseObject
    field :name, String, null: false
    field :barcode, String, null: false
    field :wb_code, String, null: false
    field :code, String, null: false
    field :organization, Types::OrganizationType, null: false
  end
end
