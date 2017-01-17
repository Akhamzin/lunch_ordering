require 'rails_helper'

RSpec.describe User, type: :model do
	describe "Custom field to Devise" do
	  	it { should respond_to(:name) }
	end
	describe "Associations" do
		it { should belong_to(:role) }
	end
	describe "Nested attributes" do
		it{ should accept_nested_attributes_for :role }
	end
end
