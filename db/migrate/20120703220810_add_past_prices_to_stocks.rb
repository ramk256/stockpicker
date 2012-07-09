class AddPastPricesToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :past_prices, :string

  end
end
