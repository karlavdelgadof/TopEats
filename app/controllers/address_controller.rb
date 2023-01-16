class AddressController < ApplicationController
  def index
    render json: Address.all
  end

  def show;end

  def create
    address = Address.new(address_params)
    if address.save
      render json: address, status: :ok
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  def update
    address = find_address
    if address.update(address_params)
      render json: address , status: :found
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    address = find_address
    address.destroy
    render status: :not_found
  end

  private

  def find_address
    Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:description)
  end
end
