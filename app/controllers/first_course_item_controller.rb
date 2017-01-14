class FirstCourseItemController < ApplicationController
  before_action :authenticate_user!

  def new
  	@first_course_item = FirstCourseItem.new
  end

  def create
	@menu = Menu.find(params[:menu_id])
	@first_course_item = @menu.first_course_items.new(menu_list_params)

	respond_to do |format|
      if @first_course_item.save
        format.html { redirect_to menu_url(@menu) }  
      else
        render 'new'
      end
    end
  end

	private

	  def menu_list_params
	    params.require(:first_course_item).permit(:menu_id, :name, :price, :food_image)
	  end

end
