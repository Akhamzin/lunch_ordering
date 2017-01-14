class UserOrderController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@orders = UserOrder.where(date: Date.today)
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
				format.html { redirect_to root_url, alert: "This order didn't save. You already have an order for today." } 
			end
		end
	end

	private

	def order_params
		params.require(:user_order).permit(:first_course_item_id, :main_course_item_id, :drink_item_id)
	end

end
