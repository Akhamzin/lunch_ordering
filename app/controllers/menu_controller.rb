class MenuController < ApplicationController
  before_action :authenticate_user!
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
    @menu = Menu.find(params[:id])
    @first_course_list = @menu.first_course_items
    @main_course_list = @menu.main_course_items
    @drink_list = @menu.drink_items
  end  
end
