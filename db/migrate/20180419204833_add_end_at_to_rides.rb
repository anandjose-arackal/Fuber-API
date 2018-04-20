class AddEndAtToRides < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :end_at, :datetime
  end
end
