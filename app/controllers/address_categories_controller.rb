class AddressCategoriesController < ApplicationController
  before_action :set_address_category, except: [:index, :new, :create]
  
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
  end
  
  def edit
  end
  
  def update
    if @address_category.update(address_category_params)
      flash[:success] = "The address category was updated successfully!"
      redirect_to address_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @address_category.destroy
    flash[:success] = "The address category was deleted successfully!"
    redirect_to address_categories_path
  end
  
  private
    def address_category_params
      params.require(:address_category).permit(:name)
    end
    
    def set_address_category
      @address_category = AddressCategory.find(params[:id])
    end
end