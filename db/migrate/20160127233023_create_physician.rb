class CreatePhysician < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :gender
      t.string :permit_number
      t.timestamps
    end
  end
end
