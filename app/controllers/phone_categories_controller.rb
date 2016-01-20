class PhoneCategoriesController < ApplicationController
  before_action :set_phone_category, except: [:index, :new, :create]
  
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
  end
  
  def edit
  end
  
  def update
    if @phone_category.update(phone_category_params)
      flash[:success] = "The phone category was updated successfully!"
      redirect_to phone_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @phone_category.destroy
    flash[:success] = "The phone category was deleted successfully!"
    redirect_to phone_categories_path
  end
  
  private
    def phone_category_params
      params.require(:phone_category).permit(:name)
    end
    
    def set_phone_category
      @phone_category = PhoneCategory.find(params[:id])
    end
end