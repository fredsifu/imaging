class Patient < ActiveRecord::Base
  has_many :physicians
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true
  has_many :phones, as: :phonable, dependent: :destroy
end