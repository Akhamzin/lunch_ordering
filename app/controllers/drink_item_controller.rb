class DrinkItemController < ApplicationController
  before_action :authenticate_user!

  def new
  	@drink_item = DrinkItem.new
  end

  def create
	@menu = Menu.find(params[:menu_id])
	@drink_item = @menu.drink_items.new(menu_list_params)

	respond_to do |format|
      if @drink_item.save
        format.html { redirect_to menu_url(@menu) }  
      else
        render 'new'
      end
    end
  end

	private

	  def menu_list_params
	    params.require(:drink_item).permit(:menu_id, :name, :price, :food_image)
	  end

end
