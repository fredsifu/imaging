class MachinesController < ApplicationController
  def index
    @machines = Machine.paginate(page: params[:page], per_page: 2)
  end

  def new
    @machine = Machine.new
  end
  
  def create
    @machine = Machine.new(machine_params)
    
    if @machine.save
      flash[:success] = "The machine was created successfully!"
      redirect_to machine_path(@machine)
    else
      render 'new'
    end
  end
  
  def show
    @machine = Machine.find(params[:id])
  end
  
  def edit
    @machine = Machine.find(params[:id])
  end
  
  def update
    @machine = Machine.find(params[:id])
    
    if @machine.update(machine_params)
      flash[:success] = "The machine was updated successfully!"
      redirect_to machine_path(@machine)
    else
      render 'edit'
    end
  end
  
  def destroy
    Machine.find(params[:id]).destroy
    flash[:success] = "The machine was deleted successfully!"
    redirect_to machines_path
  end

  private
    def machine_params
      params.require(:machine).permit(:internal_id, :readable_name, :location, :picture, :imaging_type, :model, :serial_number)
    end
end