class CreatePhoneCategory < ActiveRecord::Migration
  def change
    create_table :phone_categories do |t|
      t.string :name
    end
  end
end
