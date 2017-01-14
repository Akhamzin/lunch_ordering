class FirstCourseItem < ActiveRecord::Base
	belongs_to :menu
	has_many :user_orders
	has_attached_file :food_image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :food_image, content_type: /\Aimage\/.*\z/
	validates :name, presence: true
	validates :price, presence: true, numericality: { greater_than: 0 }
end
