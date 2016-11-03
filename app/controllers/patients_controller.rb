class PatientsController < ApplicationController
  before_action :set_patient, except: [:index, :new, :create, :autocomplete]
  
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
    @prescriptions = @patient.prescriptions.paginate(page: params[:page], per_page: 3).order('created_at DESC')
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

  def autocomplete
    q = "%#{params[:term]}%"
    @patients = Patient.where("last_name LIKE ? OR first_name LIKE ? OR insurance_number LIKE ?", q, q, q).order(:last_name)
    respond_to do |format|
      format.html
      format.json { 
        render json: @patients
      }
    end
  end

  private
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :middle_name, :gender, :birthdate, :insurance_number, :complementary_insurance_number)
    end
    
    def set_patient
      @patient = Patient.find(params[:id])
    end
end