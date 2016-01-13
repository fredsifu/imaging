class CreateAddressCategory < ActiveRecord::Migration
  def change
    create_table :address_categories do |t|
      t.string :name
    end
  end
end
