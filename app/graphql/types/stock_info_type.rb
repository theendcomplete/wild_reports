module Types
  class StockInfoType < BaseModel
    field :last_change_date, Scalars::DateTime, null: false
    field :quantity, Int, null: false
  end
end
