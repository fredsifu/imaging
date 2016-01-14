class PatientPhone < ActiveRecord::Base
  belongs_to :patient
  belongs_to :phone
end