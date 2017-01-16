class MainCourseItemController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission, only: [:new, :create]

  def new
    if Menu.exists?(params[:menu_id])
      @menu = Menu.find(params[:menu_id])
      if @menu.date == Date.today
        @main_course_item = MainCourseItem.new
      else
        render :file => "#{Rails.root}/public/500"
      end
    else
      #redirect_to root_url
      render :file => "#{Rails.root}/public/404"
    end
  	#@main_course_item = MainCourseItem.new
  end

  def create
	@menu = Menu.find(params[:menu_id])
	@main_course_item = @menu.main_course_items.new(menu_list_params)

	respond_to do |format|
      if @main_course_item.save
        format.html { redirect_to menu_url(@menu) }  
      else
        format.html { render 'new' }
      end
    end
  end

	private

	  def menu_list_params
	    params.require(:main_course_item).permit(:menu_id, :name, :price, :food_image)
	  end

    def check_permission
      if current_user.role_id != 1
        redirect_to root_path, alert: 'Permission denied'
      end
    end


end
