class CreateStockListings < ActiveRecord::Migration
  def change
    create_table :stock_listings do |t|
      t.string :symbol
      t.string :name

      t.timestamps
    end
  end
end
