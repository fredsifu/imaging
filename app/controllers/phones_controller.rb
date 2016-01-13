class PhonesController < ApplicationController
  def new
    @phone = Phone.new
    @phone_categories = PhoneCategory.all
  end
  
  def create
    @phone = Phone.new(phone_params)
    
    if @phone.save
      flash[:success] = "The phone number was created successfully!"
      redirect_to phone_path(@phone)
    else
      render 'new'
    end
  end
  
  def show
    @phone = Phone.find(params[:id])
    @phone_category = PhoneCategory.find(@phone.category)
  end
  
  def edit
    @phone = Phone.find(params[:id])
    @phone_categories = PhoneCategory.all
  end
  
  def update
    @phone = Phone.find(params[:id])
    
    if @phone.update(phone_params)
      flash[:success] = "The phone number was updated successfully!"
      redirect_to phone_path(@phone)
    else
      render 'edit'
    end
  end
  
  def destroy
    Phone.find(params[:id]).destroy
    flash[:success] = "The phone number was deleted successfully!"
    redirect_to root_path
  end
  
  private
    def phone_params
      params.require(:phone).permit(:number, :category)
    end
end