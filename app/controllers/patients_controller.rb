class PatientsController < ApplicationController
  before_action :set_patient, except: [:index, :new, :create]
  
  def index
    @patients = Patient.paginate(page: params[:page], per_page: 15).order('last_name ASC')
  end

  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new(patient_params)
    
    if @patient.save
      flash[:success] = "The patient profile was created successfully!"
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @patient.update(patient_params)
      flash[:success] = "The patient profile was updated successfully!"
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end
  
  def destroy
    @patient.destroy
    flash[:success] = "The patient profile was deleted successfully!"
    redirect_to patients_path
  end

  private
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :middle_name, :insurance_number, :complementary_insurance_number, address_ids: [], phone_ids: [])
    end
    
    def set_patient
      @patient = Patient.find(params[:id])
    end
end