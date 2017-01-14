class AddAttachmentFoodImageToFirstCourseItems < ActiveRecord::Migration
  def self.up
    change_table :first_course_items do |t|
      t.attachment :food_image
    end
  end

  def self.down
    remove_attachment :first_course_items, :food_image
  end
end
