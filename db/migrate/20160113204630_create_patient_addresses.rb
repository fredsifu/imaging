class CreatePatientAddresses < ActiveRecord::Migration
  def change
    create_table :patient_addresses do |t|
      t.integer :patient_id
      t.integer :address_id
    end
  end
end
