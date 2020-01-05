class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
  end

  def edit
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business, notice: 'Business listing was successfully created.'
    else
      render :new
    end
  end

  def update
    if @business.update(business_params)
      redirect_to @business, notice: 'Business listing was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to businesses_url, notice: 'Business listing was successfully destroyed.'
  end

  private
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:name, :memo, :city, :state)
    end
end
