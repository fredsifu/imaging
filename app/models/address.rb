class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  
  validates :line1, presence: true, length: { minimum: 2, maximum: 100}
  validates :country_code, presence: true
  validates :region, presence: true, length: { minimum: 2, maximum: 50 }
  validates :city, presence: true, length: { minimum: 2, maximum: 50 }
  validates :zipcode, presence: true, length: { minimum: 2, maximum: 15 }
  validates :category, presence: true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
  
  def category_name
    AddressCategory.find(category).name
  end
end