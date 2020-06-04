module Types
  class ItemType < Types::BaseObject
    field :name, String, null: false
    field :barcode, String, null: false
    field :wb_code, String, null: false
    field :code, String, null: false
    field :organization, Types::OrganizationType, null: false
    field :stock, Types::StockInfoType, null: true

    def stock
      object.stock_infos.last
    end

    field :sales, [Types::SalesInfoType], null: true
    def sales
      object.sales_infos.last(5)
    end
  end
end
