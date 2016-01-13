class CreatePhone < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.integer :category
      t.timestamps
    end
  end
end