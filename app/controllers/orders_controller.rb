class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def show
    render json: find_order
  end

  def create
    order = Order.new(order_params)
    if order.save
      render json: order, status: :ok
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    order = find_order
    order.destroy
    render status: :not_found
  end


  def find_order
    Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :order, :courier, :total_price)
  end
end
