class Menu < ActiveRecord::Base
	has_many :first_course_items
	has_many :main_course_items
	has_many :drink_items
	accepts_nested_attributes_for :drink_items
	accepts_nested_attributes_for :main_course_items
	accepts_nested_attributes_for :first_course_items
	validates :date, presence: true, uniqueness: true


	def self.already_created_today?
	 	@menu_last_record = self.last
	 	if @menu_last_record == nil
	 		false
	 	elsif  @menu_last_record.date == Date.today
	 		true
	 	else
	 		false
	 	end
	 end
end
