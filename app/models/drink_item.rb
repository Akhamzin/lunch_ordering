class DrinkItem < ActiveRecord::Base
	
	belongs_to :menu
	has_many :user_orders
	has_attached_file :food_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "images/:style/missing.png"
  	validates_attachment_content_type :food_image, content_type: /\Aimage\/.*\z/
	validates :name, presence: true
	validates :price, presence: true, numericality: { greater_than: 0 }
	

	def price=(val)
	    val.sub!(',', '.') if val.is_a?(String)
	    self['price'] = val
  	end
end
