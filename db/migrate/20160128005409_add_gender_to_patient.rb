class AddGenderToPatient < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.string :gender
    end
  end
end
