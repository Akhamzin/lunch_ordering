require 'rails_helper'

RSpec.describe UserOrder, type: :model do
	describe "Associations" do
		it { should belong_to(:first_course_item) }
		it { should belong_to(:main_course_item) }
		it { should belong_to(:drink_item) }
	end
	describe "Presence" do
  		it { should validate_uniqueness_of(:order_owner).scoped_to(:date) }
  	end
end
