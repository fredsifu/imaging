class AddressesController < ApplicationController
  before_action :set_address, except: [:index, :new, :create]
  
  def index
    @addresses = @addressable.addresses
  end

  def new
    @address = Address.new
    @address_categories = AddressCategory.all
  end
  
  def create
    @address = @addressable.addresses.new(address_params)

    if @address.save
      flash[:success] = "The address was created successfully!"
      redirect_to @addressable
    else
      render 'new'
    end
  end
  
  def show
    @address_category = AddressCategory.find(@address.category)
  end
  
  def edit
    @address_categories = AddressCategory.all
  end
  
  def update
    if @address.update(address_params)
      flash[:success] = "The address was updated successfully!"
      redirect_to @addressable
    else
      render 'edit'
    end
  end
  
  def destroy
    @address.destroy
    flash[:success] = "The address was deleted successfully!"
    redirect_to @addressable
  end
  
  private
    def address_params
      params.require(:address).permit(:line1, :line2, :city, :region, :country_code, :zipcode, :category)
    end

    def set_address
      @address = Address.find(params[:id])
    end
end