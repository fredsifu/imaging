class CreatePrescription < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :physician_id
      t.integer :patient_id
      t.string :clinical_information
      t.integer :status
    end
  end
end
