require 'rails_helper'

RSpec.describe Menu, type: :model do
	describe "Associations" do
		it { should have_many(:first_course_items) }
		it { should have_many(:main_course_items) }
		it { should have_many(:drink_items) }
	end
	describe "Nested attributes" do
		it{ should accept_nested_attributes_for :drink_items }
		it{ should accept_nested_attributes_for :main_course_items }
		it{ should accept_nested_attributes_for :first_course_items }
	end
	describe "Uniqueness" do
  		it { should validate_uniqueness_of(:date) }
	end
	describe "Presence" do
  		it { should validate_presence_of(:date) }
  	end
end
