class Patient < ActiveRecord::Base
  has_many :physicians
  has_many :patient_addresses, dependent: :destroy
  has_many :addresses, through: :patient_addresses
  has_many :patient_phones, dependent: :destroy
  has_many :phones, through: :patient_phones
end