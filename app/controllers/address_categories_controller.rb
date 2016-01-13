class AddressCategoriesController < ApplicationController
  def index
    @address_categories = AddressCategory.all
  end
  
  def new
    @address_category = AddressCategory.new
  end
  
  def create
    @address_category = AddressCategory.new(address_category_params)
    
    if @address_category.save
      flash[:success] = "The address category was created successfully!"
      redirect_to address_categories_path
    else
      render 'new'
    end
  end
  
  def show
    @address_category = AddressCategory.find(params[:id])
  end
  
  def edit
    @address_category = AddressCategory.find(params[:id])
  end
  
  def update
    @address_category = AddressCategory.find(params[:id])

    if @address_category.update(address_category_params)
      flash[:success] = "The address category was updated successfully!"
      redirect_to address_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    AddressCategory.find(params[:id]).destroy
    flash[:success] = "The address category was deleted successfully!"
    redirect_to address_categories_path
  end
  
  private
    def address_category_params
      params.require(:address_category).permit(:name)
    end
end