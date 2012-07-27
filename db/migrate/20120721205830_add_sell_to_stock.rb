class AddSellToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :sell, :string

  end
end
