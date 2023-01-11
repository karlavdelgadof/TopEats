class MenuItemsController < ApplicationController
  def index
    render json: MenuItem.all
  end

  def show
    render json: find_menu_item
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      render json: @menu_item, status: :ok
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item = find_menu_item
    @menu_item.destroy
    render status: :not_found
  end


  def find_menu_item
    MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name)
  end
end
