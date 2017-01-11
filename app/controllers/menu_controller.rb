class MenuController < ApplicationController
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
end
