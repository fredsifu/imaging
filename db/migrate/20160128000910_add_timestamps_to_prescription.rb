class AddTimestampsToPrescription < ActiveRecord::Migration
  def change
    change_table :prescriptions do |t|
      t.timestamps
    end
  end
end
