class CreateCabStatuses < ActiveRecord::Migration[5.1]
  def up
    create_table :cab_statuses do |t|
      t.boolean :available
      t.float :latitude
      t.float :longitude
      t.references :cab, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :cab_statuses
  end
end
