class PhysiciansController < ApplicationController
  before_action :set_physician, except: [:index, :new, :create]
  
  def index
    @physicians = Physician.paginate(page: params[:page], per_page: 10)
  end

  def new
    @physician = Physician.new
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
  end
  
  def edit
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

  private
    def physician_params
      params.require(:physician).permit(:first_name, :last_name, :middle_name, :numero_ordonnance, address_ids: [], phone_ids: [])
    end
    
    def set_physician
      @physician = Physician.find(params[:id])
    end
end