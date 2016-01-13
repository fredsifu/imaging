class CreateMachine < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :internal_id
      t.string :readable_name
      t.string :location
      t.integer :type
      t.string :model
      t.string :serial_number
    end
  end
end
