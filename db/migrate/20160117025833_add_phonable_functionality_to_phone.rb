class AddPhonableFunctionalityToPhone < ActiveRecord::Migration
  def change
    change_table :phones do |t|
      t.integer :phonable_id
      t.string :phonable_type
    end
  end
end
