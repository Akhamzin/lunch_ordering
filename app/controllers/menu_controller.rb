class MenuController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission, only: [:new, :create]
 
  def index
  	@menus = Menu.all
  end

  def new
  	@menu = Menu.new
  end

  def create
  	@menu = Menu.new(date: Date.today)
  	respond_to do |format|
	  	if @menu.save
	  		format.html { redirect_to menu_index_path }
	  	else
	  		format.html { render :index }
	  	end
	 end
  end

  def show
    if Menu.exists?(params[:id])
      @menu = Menu.find(params[:id])
      @first_course_list = @menu.first_course_items
      @main_course_list = @menu.main_course_items
      @drink_list = @menu.drink_items
    else
      #redirect_to root_url
      render :file => "#{Rails.root}/public/404"
    end
    
  end  

  private

  def check_permission
    if current_user.role_id != 1
      redirect_to root_path, alert: 'Permission denied'
    end
  end
end
