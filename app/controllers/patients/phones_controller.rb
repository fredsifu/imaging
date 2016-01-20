class Patients::PhonesController < PhonesController
  before_action :set_phonable
  
  private
    def set_phonable
      @phonable = Patient.find(params[:patient_id])
    end
end