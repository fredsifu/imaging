class RenameAddressCountryToCountryCode < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.rename :country, :country_code
    end
  end
end
