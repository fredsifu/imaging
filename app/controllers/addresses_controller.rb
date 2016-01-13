class AddressesController < ApplicationController
  def new
    @address = Address.new
    @address_categories = AddressCategory.all
  end
  
  def create
    @address = Address.new(address_params)
    
    if @address.save
      flash[:success] = "The address was created successfully!"
      redirect_to address_path(@address)
    else
      render 'new'
    end
  end
  
  def show
    @address = Address.find(params[:id])
    @address_category = AddressCategory.find(@address.category)
  end
  
  def edit
    @address = Address.find(params[:id])
    @address_categories = AddressCategory.all
  end
  
  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      flash[:success] = "The address was updated successfully!"
      redirect_to address_path(@address)
    else
      render 'edit'
    end
  end
  
  def destroy
    Address.find(params[:id]).destroy
    flash[:success] = "The address was deleted successfully!"
    redirect_to root_path
  end
  
  private
    def address_params
      params.require(:address).permit(:line1, :line2, :city, :region, :country_code, :zipcode, :category)
    end
end