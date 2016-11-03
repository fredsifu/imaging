class Physicians::AddressesController < AddressesController
  before_action :set_addressable
  
  private
    def set_addressable
      @addressable = Physician.find(params[:physician_id])
    end
end