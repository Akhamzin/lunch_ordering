class UserOrder < ActiveRecord::Base
	belongs_to :first_course_item
	belongs_to :main_course_item
	belongs_to :drink_item

	#validates :order_owner, uniqueness: true
	validates :order_owner, uniqueness: { scope: [:order_owner, :date] }
end
