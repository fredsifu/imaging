class Phone < ActiveRecord::Base
  belongs_to :phonable, polymorphic: true
  
  def category_name
    PhoneCategory.find(category).name
  end
end