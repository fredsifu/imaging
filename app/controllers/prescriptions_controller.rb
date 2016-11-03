class PrescriptionsController < ApplicationController
  before_action :set_prescription, except: [:index, :new, :create]
  
  def index
    @physician = Physician.find(params[:physician_id])
    @prescriptions = @physician.prescriptions.paginate(page: params[:page], per_page: 3).order('updated_at DESC')
  end

  def new
    @physician = Physician.find(params[:physician_id])
    @prescription = Prescription.new
  end
  
  def create
    @physician = Physician.find(params[:physician_id])
    @prescription = @physician.prescriptions.new(prescription_params)
    
    if @prescription.save
      flash[:success] = "The prescription was created successfully!"
      redirect_to physician_prescription_path(@physician, @prescription)
    else
      render 'new'
    end
  end
  
  def show
    @physician = @prescription.physician
    @patient = @prescription.patient
  end
  
  def edit
    @physician = @prescription.physician
    @patient = @prescription.patient
  end
  
  def update
    @physician = Physician.find(params[:physician_id])
    
    if @prescription.update(prescription_params)
      flash[:success] = "The prescription was updated successfully!"
      redirect_to physician_prescription_path(@physician, @prescription)
    else
      render 'edit'
    end
  end
  
  def destroy
    @physician = @prescription.physician
    @prescription.destroy
    flash[:success] = "The prescription was deleted successfully!"
    redirect_to physician_path(@physician)
  end
  
  private
    def prescription_params
      params.require(:prescription).permit(:physician_id, :patient_id, :clinical_information, :status) #add specificities like claustrophobia, allergies, priority, range
    end
    
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end
end