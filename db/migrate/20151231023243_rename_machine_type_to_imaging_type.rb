class RenameMachineTypeToImagingType < ActiveRecord::Migration
  def change
    change_table :machines do |t|
      t.rename :type, :imaging_type
    end
  end
end
