class MainCourseItemController < ApplicationController
  before_action :authenticate_user!

  def new
  	@main_course_item = MainCourseItem.new
  end

  def create
	@menu = Menu.find(params[:menu_id])
	@main_course_item = @menu.main_course_items.new(menu_list_params)

	respond_to do |format|
      if @main_course_item.save
        format.html { redirect_to menu_url(@menu) }  
      else
        render 'new'
      end
    end
  end

	private

	  def menu_list_params
	    params.require(:main_course_item).permit(:menu_id, :name, :price, :food_image)
	  end

end
