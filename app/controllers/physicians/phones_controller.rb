class Physicians::PhonesController < PhonesController
  before_action :set_phonable
  
  private
    def set_phonable
      @phonable = Physician.find(params[:physician_id])
    end
end