class CreatePatientPhones < ActiveRecord::Migration
  def change
    create_table :patient_phones do |t|
      t.integer :patient_id
      t.integer :phone_id
    end
  end
end
