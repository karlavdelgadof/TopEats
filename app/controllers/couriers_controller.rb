class CouriersController < ApplicationController
  def index
    render json: Courier.all
  end

  def show
    render json: find_courier
  end

  def create
    @courier = Courier.new(courier_params)
    if @courier.save
      render json: @courier, status: :ok
    else
      render json: @courier.errors, status: :unprocessable_entity
    end
  end

  def update
    @courier = find_courier
    if @courier.update(courier_params)
      render json: @courier , status: :found
    else
      render json: @courier.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @courier = find_courier
    @courier.destroy
    render status: :not_found
  end

  private

  def find_courier
    Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:full_name, :email, :phone_number, :address)
  end
end
