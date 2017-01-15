class FirstCourseItemController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission, only: [:new, :create]

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
        format.html { render 'new' }
      end
    end
  end

	private

	  def menu_list_params
	    params.require(:first_course_item).permit(:menu_id, :name, :price, :food_image)
	  end

    def check_permission
      if current_user.role_id != 1
        redirect_to root_path, alert: 'Permission denied'
      end
    end


end
