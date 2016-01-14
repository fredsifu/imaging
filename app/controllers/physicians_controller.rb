class PhysiciansController < ApplicationController
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
    @physician = Physician.find(params[:id])
  end
  
  def edit
    @physician = Physician.find(params[:id])
  end
  
  def update
    @physician = Physician.find(params[:id])
    
    if @physician.update(physician_params)
      flash[:success] = "The physician profile was updated successfully!"
      redirect_to physician_path(@physician)
    else
      render 'edit'
    end
  end
  
  def destroy
    Physician.find(params[:id]).destroy
    flash[:success] = "The physician profile was deleted successfully!"
    redirect_to physicians_path
  end

  private
    def physician_params
      params.require(:physician).permit(:first_name, :last_name, :middle_name, :numero_ordonnance, address_ids: [], phone_ids: [])
    end
end