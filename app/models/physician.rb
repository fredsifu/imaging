class Physician < ActiveRecord::Base
  has_many :prescriptions
  has_many :patients, through: :prescriptions
  has_many :physician_specialties, dependent: :destroy
  has_many :specialties, through: :physician_specialties
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phonable, dependent: :destroy
end