class Patient < ActiveRecord::Base
  has_many :prescriptions
  has_many :physicians, through: :prescriptions
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phonable, dependent: :destroy
end