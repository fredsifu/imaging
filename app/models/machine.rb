class Machine < ActiveRecord::Base
  validates :internal_id, presence: true, length: { minimum: 2, maximum: 40 }
  validates :readable_name, presence: true, length: { minimum: 2, maximum: 40 }
  validates :location, presence: true, length: { minimum: 2, maximum: 40 }
  validates :imaging_type, presence: true
  validates :model, presence: true, length: { minimum: 2, maximum: 40 }
  validates :serial_number, presence: true, length: { minimum: 2, maximum: 40 }
end