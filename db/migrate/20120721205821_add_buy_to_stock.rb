class AddBuyToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :buy, :string

  end
end
