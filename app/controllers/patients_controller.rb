class PatientsController < ApplicationController
  def index
    @patients = Patient.paginate(page: params[:page], per_page: 5)
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
    @patient = Patient.find(params[:id])
  end
  
  def edit
    @patient = Patient.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:id])
    
    if @patient.update(patient_params)
      flash[:success] = "The patient profile was updated successfully!"
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end
  
  def destroy
    Patient.find(params[:id]).destroy
    flash[:success] = "The patient profile was deleted successfully!"
    redirect_to root_path
  end

  private
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :insurance_number, address_ids: [], phone_ids: [])
    end
end