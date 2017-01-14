class DrinkItem < ActiveRecord::Base
	belongs_to :menu
	has_many :user_orders
	validates :name, presence: true
	validates :price, presence: true
end
