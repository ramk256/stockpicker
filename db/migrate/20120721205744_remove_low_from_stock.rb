class RemoveLowFromStock < ActiveRecord::Migration
  def up
    remove_column :stocks, :low
      end

  def down
    add_column :stocks, :low, :string
  end
end
