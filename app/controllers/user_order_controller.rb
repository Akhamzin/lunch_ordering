class UserOrderController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permission, only: [:index]
	
	def index
		#@orders = UserOrder.where(date: Date.today)
		@menu_date =
      if params[:for_date]
        Date.parse(params[:for_date]) 
      else
        Date.today
      end
      	@orders = UserOrder.where('date = ?', "#{@menu_date}") 
		@total_all = 0
	end

	def new
		@order = UserOrder.new
		@menu = Menu.last  
		@first_course = @menu.first_course_items
		@first = @first_course.collect { |fc| [ fc.name, fc.id ]  }
		@main_course = @menu.main_course_items
		@main = @main_course.collect { |mc| [ mc.name, mc.id ]  }
		@drink_list = @menu.drink_items
		@drink = @drink_list.collect { |dl| [ dl.name, dl.id ]  }
	end

	def create
		@order = UserOrder.new(order_params)
		@order.date = Date.today
		@order.order_owner = current_user.name
		respond_to do |format|
			if @order.save
				format.html { redirect_to root_url, notice: "You successfuly ordered lunch." }
			else
				format.html { redirect_to root_url, alert: "This order didn't saved. You already have an order for today." } 
			end
		end
	end

	private

	def order_params
		params.require(:user_order).permit(:first_course_item_id, :main_course_item_id, :drink_item_id)
	end

    def check_permission
      if current_user.role_id != 1
        redirect_to root_path, alert: 'Permission denied'
      end
    end
end
