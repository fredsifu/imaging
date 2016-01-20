class PhonesController < ApplicationController
  before_action :set_phone, except: [:index, :new, :create]
  
  def index
    @phones = @phonable.phones
  end
  
  def new
    @phone = Phone.new
    @phone_categories = PhoneCategory.all
  end
  
  def create
    @phone = @phonable.phones.new(phone_params)

    if @phone.save
      flash[:success] = "The phone number was created successfully!"
      redirect_to @phonable
    else
      render 'new'
    end
  end
  
  def show
    @phone_category = PhoneCategory.find(@phone.category)
  end
  
  def edit
    @phone_categories = PhoneCategory.all
  end
  
  def update
    if @phone.update(phone_params)
      flash[:success] = "The phone number was updated successfully!"
      redirect_to @phonable
    else
      render 'edit'
    end
  end
  
  def destroy
    @phone.destroy
    flash[:success] = "The phone number was deleted successfully!"
    redirect_to @phonable
  end
  
  private
    def phone_params
      params.require(:phone).permit(:number, :category)
    end
    
    def set_phone
      @phone = Phone.find(params[:id])
    end
end