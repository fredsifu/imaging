class AddBirthdateToPatient < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.date :birthdate
    end
  end
end