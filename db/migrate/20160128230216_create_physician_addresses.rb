class CreatePhysicianAddresses < ActiveRecord::Migration
  def change
    create_table :physician_addresses do |t|
      t.integer :physician_id
      t.integer :address_id
    end
  end
end
