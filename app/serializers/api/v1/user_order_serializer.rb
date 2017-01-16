class Api::V1::UserOrderSerializer < Api::V1::BaseSerializer
	attributes :id, :order_owner, :first_course_item_name, :first_course_item_price, :main_course_item_name, :main_course_item_price, :drink_item_name, :drink_item_price

	has_one :first_course_item_name
	has_one :main_course_item_name
	has_one :drink_item_name
	has_one :first_course_item_price
	has_one :main_course_item_price
	has_one :drink_item_price


	def first_course_item_name
		object.first_course_item.name
	end

	def main_course_item_name
		object.main_course_item.name
	end

	def drink_item_name
		object.drink_item.name
	end

	def first_course_item_price
		object.first_course_item.price
	end

	def main_course_item_price
		object.main_course_item.price
	end

	def drink_item_price
		object.drink_item.price
	end
end