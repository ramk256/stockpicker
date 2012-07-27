class AddLowToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :low, :string

  end
end
