class CreateRides < ActiveRecord::Migration[5.1]
  def up
    create_table :rides do |t|
      t.float :source_latitude
      t.float :source_longitude
      t.float :destination_latitude
      t.float :destination_longitude
      t.references :cab, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :rides
  end
end
