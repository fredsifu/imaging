class CreatePhysicianPhones < ActiveRecord::Migration
  def change
    create_table :physician_phones do |t|
      t.integer :physician_id
      t.integer :phone_id
    end
  end
end
