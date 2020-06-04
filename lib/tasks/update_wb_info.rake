namespace :update_wb_info do
  desc "Updates item's sales and stock info"
  task run: :environment do
    Organization.joins(:wb_api_key).where("wb_api_keys.organization_id = organization_id").each do |organization|
      conn = Faraday.new(
        url: "https://suppliers-stats.wildberries.ru",
        headers: {"Content-Type" => "application/json"}
      )

      stocks = conn.get("api/v1/supplier/stocks") { |req|
        req.params["dateFrom"] = DateTime.current - 10.days
        req.params["key"] = organization.wb_api_key.key
      }

      Rails.logger.info("stocks: " + stocks.body)
      sales = conn.get("api/v1/supplier/sales") { |req|
        req.params["dateFrom"] = DateTime.current - 10.days
        req.params["key"] = organization.wb_api_key.key
      }

      Rails.logger.info("sales: " + sales.body)
      parsed_stocks = JSON.parse(stocks.body, object_class: Hash)
      parsed_stocks.each do |stock|
        item = organization.items.find_by(barcode: stock["barcode"])
        item&.stock_infos&.create(stock_params(stock))
      end
      parsed_sales = JSON.parse(sales.body, object_class: Hash)
      parsed_sales.each do |sale|
        item = organization.items.find_by(barcode: sale["barcode"])
        item&.sales_infos&.create(sales_params(sale))
      end
    end
  end

  def stock_params(stock)
    item_params = StockInfo.new.attributes.keys
    new_stock = {}
    stock.each do |key, value|
      if item_params.include? key.to_s.underscore
        new_stock[key.to_s.underscore] = value
      end
    end
    new_stock
  end

  def sales_params(sale)
    sale_params = SalesInfo.new.attributes.keys
    new_sale = {}
    sale.each do |key, value|
      if sale_params.include? key.to_s.underscore
        new_sale[key.to_s.underscore] = value
      end
    end
    new_sale
  end
end
