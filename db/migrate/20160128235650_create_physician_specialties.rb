class CreatePhysicianSpecialties < ActiveRecord::Migration
  def change
    create_table :physician_specialties do |t|
      t.integer :physician_id
      t.integer :specialty_id
    end
  end
end
