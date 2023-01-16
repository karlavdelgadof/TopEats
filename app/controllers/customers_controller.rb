class CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: find_customer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :ok
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    @customer = find_customer
    if @customer.update(customer_params)
      render json: @customer , status: :found
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = find_customer
    @customer.destroy
    render status: :not_found
  end

  private

  def find_customer
    Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:full_name, :email, :phone_number, :address_id)
  end
end
