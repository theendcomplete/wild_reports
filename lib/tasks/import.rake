# frozen_string_literal: true

namespace :import do
  task items: :environment do
    require 'csv'
    items_path = 'lib/tasks/import/items.csv'

    items_csv = CSV.open(items_path)

    items_csv.each do |row|
      Organization.first.items.create(name: row[0], wb_code: row[2], code: row[1], barcode: row[3])
    end
  end
end
