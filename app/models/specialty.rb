class Specialty < ActiveRecord::Base
  belongs_to :physician
  
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
end