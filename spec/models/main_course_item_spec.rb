require 'rails_helper'

RSpec.describe MainCourseItem, type: :model do
  describe "Association" do
  	it { should belong_to(:menu) }
  	it { should have_many(:user_orders) }
  	
  end
  describe "Attachment" do
  	it { should have_attached_file(:food_image) }
  	it { should validate_attachment_content_type(:food_image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  end
  describe "Presence" do
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:price) }
  end
  describe "Numericality price" do
  	it { should validate_numericality_of(:price) }
  	it { should validate_numericality_of(:price).is_greater_than(0) }	
  end
end
