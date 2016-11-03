class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :physician
  has_one :prescription_category, dependent: :destroy
  
  validates :physician_id, presence: true
  validates :patient_id, presence: true
  validates :clinical_information, presence: true, length: { minimum: 10 }
end