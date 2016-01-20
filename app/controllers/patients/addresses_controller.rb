class Patients::AddressesController < AddressesController
  before_action :set_addressable
  
  private
    def set_addressable
      @addressable = Patient.find(params[:patient_id])
    end
end