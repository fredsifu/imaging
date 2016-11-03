class PhysicianSpecialty < ActiveRecord::Base
  belongs_to :physician
  belongs_to :specialty
end