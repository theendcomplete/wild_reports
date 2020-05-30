module Types
  class StockInfoType < BaseModel
    field :name, String, null: false
    field :last_change_date, Scalars::DateTime, null: false, null: false
    field :quantity, Int, null: false
  end
end
