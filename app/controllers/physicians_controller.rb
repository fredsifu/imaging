class PhysiciansController < ApplicationController
  before_action :set_physician, :only => [:show, :edit, :update, :destroy, :prescribe]
    
  def index
    @physicians = Physician.paginate(page: params[:page], per_page: 15).order('last_name ASC')
  end

  def new
    @physician = Physician.new
    @specialties = Specialty.all.order('name ASC')
  end
  
  def create
    @physician = Physician.new(physician_params)
    
    if @physician.save
      flash[:success] = "The physician profile was created successfully!"
      redirect_to physician_path(@physician)
    else
      render 'new'
    end
  end
  
  def show
    @specialties = @physician.specialties.order('name ASC')
    @prescriptions = @physician.prescriptions.paginate(page: params[:page], per_page: 3).order('updated_at DESC')
  end
  
  def edit
    @specialties = Specialty.all.order('name ASC')
  end
  
  def update
    if @physician.update(physician_params)
      flash[:success] = "The physician profile was updated successfully!"
      redirect_to physician_path(@physician)
    else
      render 'edit'
    end
  end
  
  def destroy
    @physician.destroy
    flash[:success] = "The physician profile was deleted successfully!"
    redirect_to physicians_path
  end
  
  def prescribe
    @prescription = @physician.prescriptions.new
  end
  
  private
    def physician_params
      params.require(:physician).permit(:first_name, :last_name, :middle_name, :gender, :permit_number, specialty_ids: [])
      #genre, numéro de permis, type de permis, statut, spécialités, activités, habilitations, adresse
    end
    
    def set_physician
      @physician = Physician.find(params[:id])
    end
end