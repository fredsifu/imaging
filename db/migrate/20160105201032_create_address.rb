class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :region
      t.string :country
      t.string :zipcode
      t.integer :category
    end
  end
end
