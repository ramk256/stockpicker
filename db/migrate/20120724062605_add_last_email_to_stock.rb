class AddLastEmailToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :last_email, :timestamp

  end
end
