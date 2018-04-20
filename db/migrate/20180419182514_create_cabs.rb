class CreateCabs < ActiveRecord::Migration[5.1]
  def up
    create_table :cabs do |t|
      t.string :vehicle_no
      t.boolean :pink

      t.timestamps
    end
  end

  def down
    drop_table :cabs
  end
end
