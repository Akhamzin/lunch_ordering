class Menu < ActiveRecord::Base
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
