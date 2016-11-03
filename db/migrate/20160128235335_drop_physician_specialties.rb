class DropPhysicianSpecialties < ActiveRecord::Migration
  def change
    drop_table :physician_specialties
  end
end
