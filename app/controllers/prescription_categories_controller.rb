class PrescriptionCategoriesController < ApplicationController
  before_action :set_prescription_category, except: [:index, :new, :create]
  
  def index
    @prescription_categories = PrescriptionCategory.all
  end
  
  def new
    @prescription_category = PrescriptionCategory.new
  end
  
  def create
    @prescription_category = PrescriptionCategory.new(prescription_category_params)
    
    if @prescription_category.save
      flash[:success] = "The prescription category was created successfully!"
      redirect_to prescription_categories_path
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @prescription_category.update(prescription_category_params)
      flash[:success] = "The prescription category was updated successfully!"
      redirect_to prescription_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @prescription_category.destroy
    flash[:success] = "The prescription category was deleted successfully!"
    redirect_to prescription_categories_path
  end
  
  private
    def prescription_category_params
      params.require(:prescription_category).permit(:name)
    end
    
    def set_prescription_category
      @prescription_category = PrescriptionCategory.find(params[:id])
    end
end