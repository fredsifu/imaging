class PhoneCategoriesController < ApplicationController
  def index
    @phone_categories = PhoneCategory.all
  end
  
  def new
    @phone_category = PhoneCategory.new
  end
  
  def create
    @phone_category = PhoneCategory.new(phone_category_params)
    
    if @phone_category.save
      flash[:success] = "The phone category was created successfully!"
      redirect_to phone_categories_path
    else
      render 'new'
    end
  end
  
  def show
    @phone_category = PhoneCategory.find(params[:id])
  end
  
  def edit
    @phone_category = PhoneCategory.find(params[:id])
  end
  
  def update
    @phone_category = PhoneCategory.find(params[:id])

    if @phone_category.update(phone_category_params)
      flash[:success] = "The phone category was updated successfully!"
      redirect_to phone_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    PhoneCategory.find(params[:id]).destroy
    flash[:success] = "The phone category was deleted successfully!"
    redirect_to phone_categories_path
  end
  
  private
    def phone_category_params
      params.require(:phone_category).permit(:name)
    end
end