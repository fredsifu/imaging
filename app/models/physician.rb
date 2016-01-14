class Physician < ActiveRecord::Base
  has_many :patients
  has_many :addresses
  has_many :phones
end