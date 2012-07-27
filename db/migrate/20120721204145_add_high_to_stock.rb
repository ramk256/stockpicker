class AddHighToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :high, :string

  end
end
