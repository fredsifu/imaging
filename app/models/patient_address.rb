class PatientAddress < ActiveRecord::Base
  belongs_to :patient
  belongs_to :address
end