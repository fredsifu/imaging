class CreatePatient < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :insurance_number
      t.string :complementary_insurance_number
      t.timestamps
    end
  end
end
