class AddTimestampsToMachine < ActiveRecord::Migration
  def change
    change_table :machines do |t|
      t.timestamps
    end
  end
end
