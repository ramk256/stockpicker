class RemoveHighFromStock < ActiveRecord::Migration
  def up
    remove_column :stocks, :high
      end

  def down
    add_column :stocks, :high, :string
  end
end
