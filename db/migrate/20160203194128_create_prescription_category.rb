class CreatePrescriptionCategory < ActiveRecord::Migration
  def change
    create_table :prescription_categories do |t|
      t.string :name
    end
  end
end
