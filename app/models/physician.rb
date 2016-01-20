class Physician < ActiveRecord::Base
  has_many :patients
  has_many :addresses, as: :addressable, dependant: :destroy
  has_many :phones, as: :phonable, dependant: :destroy
end