class SpecialtiesController < ApplicationController
  before_action :set_specialty, except: [:index, :new, :create]
  
  def index
    @specialties = Specialty.paginate(page: params[:page], per_page: 10).order('name ASC')
  end

  def new
    @specialty = Specialty.new
  end
  
  def create
    @specialty = Specialty.new(specialty_params)
    
    if @specialty.save
      flash[:success] = "The specialty was created successfully!"
      redirect_to specialty_path(@specialty)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @specialty.update(specialty_params)
      flash[:success] = "The specialty was updated successfully!"
      redirect_to specialty_path(@specialty)
    else
      render 'edit'
    end
  end
  
  def destroy
    @specialty.destroy
    flash[:success] = "The specialty was deleted successfully!"
    redirect_to specialties_path
  end

  private
    def specialty_params
      params.require(:specialty).permit(:name)
    end
    
    def set_specialty
      @specialty = Specialty.find(params[:id])
    end
end