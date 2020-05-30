module Types
  class SalesInfoType < Types::BaseObject
    field :last_change_date, Scalars::DateTime, null: false
    field :date, Scalars::DateTime, null: false
    field :number, String, null: false
    field :order_id, String, null: false
    field :income_id, String, null: false
    field :sale_id, String, null: false
    field :quantity, Int, null: false
    field :total_price, Int, null: false
  end
end
