class RemoveLastEmailToStock < ActiveRecord::Migration
  def up
    remove_column :stocks, :last_email
      end

  def down
    add_column :stocks, :last_email, :timestamp
  end
end
